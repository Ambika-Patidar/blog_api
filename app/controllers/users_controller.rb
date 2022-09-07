class UsersController < BaseController
  before_action :assign_user, only: %i[follow unfollow accept]

  def index
    @users = User.where.not(id: current_user.id)
    render_response(@users)
  end

  def search
    @users = User.where('full_name Like ?', "%#{params[:keyword]}%")
    render_response(@users)
  end

  def follow
    follow = if User.statuses[@user.status.to_s] == 'public'
               Follow.find_or_create_by(follower_id: current_user.id, followed_user_id: @user.id, status: 0)
             else
               Follow.find_or_create_by(follower_id: current_user.id, followed_user_id: @user.id, status: 1)
             end
    render_response(follow)
  end

  def accept
    follow = Follow.find_by(follower_id: current_user.id, followed_user_id: @user.id)
    follow.update(status: 0)
    render_response(follow)
  end

  def unfollow
    unfollow = current_user.received_follows.where(follower_id: current_user.id, followed_user_id: @user.id).destroy_all
    render_response(unfollow)
  end

  def following_user_articles
    articles = current_user.followings.includes(:articles).map { |following| { following_user_id: following.id, articles: following.articles } }
    render_response(articles)
  end

  private

  def assign_user
    @user = User.find(params[:id])
  end
end
