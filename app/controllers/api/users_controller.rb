class Api::UsersController < Api::BaseController
  def index
    @users = User.where.not(id: current_user.id)
    render_response(@users)
  end
end
