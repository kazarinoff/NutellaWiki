class BlocksController < ApplicationController
  def new
    @pages=Page.all
    if params[:format]
      @page=Page.find(params[:format])
    else
      @page=nil
    end
  end

  def show
    @block=Block.find(params['id'])
    @comments=@block.comments.includes(:user)
  end

  def edit
    @block=Block.find(params['id'])
    @comments=@block.comments
    @pages=Page.all
    @selectedpages=@block.pages
  end
  
  def update
    @block=Block.find(params[:id])
    if @block.user==current_user
      @block.update(params.require(:block).permit(:name, :kind, :description, :body))
      p params
      x=(@block.pages.ids).map! { |i| i.to_i }
      y=params[:block]['page_id'].map! { |i| i.to_i }
      z= x & y
      secondx=x-z
      secondy=y-z
      secondx.each do |i|
        Display.where("block_id = ? AND page_id = ?",@block.id, i).take.delete
      end
      secondy.each do |i|
        Display.create(block:@block,page:Page.find(i))
      end
    end
    redirect_to show_block_path(@block) and return
  end

  def create
    @block = Block.new(params.require(:block).permit(:name, :kind, :description, :body))
    @block.user=current_user
    if @block.save
      params[:block]['page_id'].each do |i|
        Display.create(block:@block,page:Page.find(i))
      end
      @block=Block.last
      redirect_to pages_index_path and return
    else
      flash[:notice] = @block.errors.messages
      redirect_to new_block_path and return
    end
  end

  def confirmdelete
    @block=Block.find(params['id'])
    redirect_to pages_index_path and return if @block.user!=current_user
  end

  def destroy
    @block=Block.find(params['id'])
    if @block.user==current_user
      @block.delete
      redirect_to pages_index_path
    else
      redirect_to show_block_path(@block)
    end
  end

  def createcomment
    session[:return_to] = request.referer
    @comment =Comment.new(params.require(:comment).permit(:body))
    @block=Block.find(params[:comment]['block_id'])
    @comment.block=@block
    @comment.user=current_user if current_user.id.to_s==params[:comment]['user_id']
    @comment.save
    flash[:notice] = @comment.errors.messages
    redirect_to session.delete(:return_to)
  end

  def destroycomment
    session[:return_to] = request.referer
    @comment=Comment.find(params[:comment]['id'])
    if @comment.user==current_user
      @comment.delete
      redirect_to session.delete(:return_to)
    else
      redirect_to session.delete(:return_to)
    end
  end
end
