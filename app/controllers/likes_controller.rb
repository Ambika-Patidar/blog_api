class LikesController < BaseController
  before_action :find_likeable, only: :create

  def create
    @like = @likeable.likes.new(user_id: current_user.id)

    if @like.save
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  private

  def find_likeable
    @likeable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @likeable = Article.find_by_id(params[:article_id]) if params[:article_id]
  end
end
