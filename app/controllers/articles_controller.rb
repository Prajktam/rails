#articles_controller
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
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
    redirect_to article_path
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
end


# <p>
# <%= render 'form', article: @article %>

# # <%= link_to 'Show', @article %> |
# # <%= link_to 'Back', articles_path %>
# </p>