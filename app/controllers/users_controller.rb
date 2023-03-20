class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
 
  def index
    @users = User.all
    
  end

  def show
    @payrolls = @user.payrolls.order(payroll_date: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
      flash[:notice] = "New user was successfully updated"
    else
      
      flash[:notice] = "New user was NOT successfully updated"
      render users_path
    end
  end

def edit
   @user = User.find(params[:id])
end



def update

  if params[:user][:password].blank?
     params[:user].delete(:password)
     params[:user].delete(:password_confirmation)
  end

  @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:notice] = "Your account information was successfully updated"
        redirect_to root_path
    else
      flash[:notice] = "Your account information was NOT successfully updated"
        render 'edit'
    end
end

def destroy
  @user = User.find(params[:id])
  @user.resume.purge
  @user.destroy

  redirect_to root_path, status: :see_other
end

private
def set_user
  @user = User.find(params[:id])
end

    def user_params
      params.require(:user).permit( :firstname, :lastname, :email, :position, :resume, :role, :phone, :password, :password_confirmation, payrolls: [])
    end

  
  

end
