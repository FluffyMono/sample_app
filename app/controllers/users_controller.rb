class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # #@user = User.new(params[:user]) # 実装は終わっていないことに注意!
    # Above had mass assignment vulneravility on Rails 4.0, disturbing and stealing admin priviledge by adding admin/1 name attribute in (params[:user])
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
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
