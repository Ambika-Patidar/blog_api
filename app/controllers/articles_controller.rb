class ArticlesController < BaseController
  def show
    @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    article = current_user.articles.new(article_params)

    if article.save
      render json: article, status: :created, location: article_path(id: article.id)
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(%i[title description])
  end
end
