class CommentsController < BaseController
  before_action :find_commentable, only: [:create]

  # POST /comments
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
  end
end
