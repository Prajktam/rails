#articles_controller
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article= Article.find(params[:id])  
    @id= params[:id]
    print @id
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json

  def create
    @article = Article.new(article_params)
    @article.user = current_user
      if @article.save
        flash[:success] = "Article was successfully created"
        redirect_to article_path(@article)
      else
        render 'new'
      end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article= Article.find(params[:id])
      if @article.update(article_params)
        flash[:success] = "Article was successfully updated"
        redirect_to article_path(@article)
      else
        render 'edit'
      end
    
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article= Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was successfully updated"
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
    private

  def article_params

    params.require(:article).permit(:title, :description)

  end
  def require_user

  end

  def require_same_user
    if current_user != @article.user && current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end

end

