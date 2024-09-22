class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # previous grammer on @user had mass assignment vulneravility on Rails 4.0, disturbing and stealing admin priviledge by adding admin/1 name attribute in (params[:user])
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = 'Welcome to the Sample App!'
      # added "and return" since DoubleRenderError had occured.
      redirect_to @user and return
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
