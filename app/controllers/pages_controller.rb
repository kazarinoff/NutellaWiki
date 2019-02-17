class PagesController < ApplicationController
  def index
    @pages=Page.all.includes(:blocks)
    @user=current_user
  end

  def show
    @user=current_user
    @page=Page.find(params[:id])
    @blocks=@page.blocks.includes(:comments)
  end

  def new
    @user=current_user
  end
  def create
    @user=current_user
    @page = Page.new(page_params)
    @page.user=@user
    @page.save
    if @page.errors.messages
      flash[:notice] = @page.errors.messages
      redirect_to pages_index_path and return
    else
      redirect_to show_page_path(@page) and return
    end
  end

  def edit
    @page=Page.find(params[:id])
  end
  
  def update
    @page=Page.find(params[:id])
    if @page.user==current_user
      @page.update(page_params)
    end
    redirect_to show_page_path(@page) and return
  end
  
  def confirmdelete
    @page=Page.find(params['id'])
    redirect_to pages_index_path and return if @page.user!=current_user
  end

  def destroy
    @page=Page.find(params['id'])
    if @page.user==current_user
      @page.delete
      redirect_to pages_index_path and return
    else
      redirect_to show_page_path(@page)
    end
  end


  private
  def page_params
    params.require(:page).permit(:name, :description,)
  end
end
