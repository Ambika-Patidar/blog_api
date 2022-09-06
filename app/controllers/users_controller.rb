class UsersController < BaseController
  def index
    @users = User.where.not(id: current_user.id)
    render_response(@users)
  end

  def search
    @users = User.where('full_name Like ?', "%#{params[:keyword]}%")
    render_response(@users)
  end
end
