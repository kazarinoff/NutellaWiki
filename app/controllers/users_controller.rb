class UsersController < ApplicationController
  def new
    if current_user
      redirect_to pages_index_path and return
    end
    @clans=Clan.all
    render :layout => false
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password))
    @user.clan=Clan.find(params[:user]['clan'])
    if @user.save
      session[:user_id]=User.last.id
      redirect_to pages_index_path and return
    else
      flash[:notice] = @user.errors.messages
      redirect_to login_path and return
    end
  end
  
  def show
    redirect_to show_user_path(current_user) and return if params['id']!=current_user.id.to_s
    @user = current_user
    @pages = @user.pages
    @blocks =@user.blocks
  end
  
  def edit
    redirect_to edit_user_path(current_user) and return if params['id']!=current_user.id.to_s
    @user = current_user
  end

  def update
  end

  def destroy
  end
end
