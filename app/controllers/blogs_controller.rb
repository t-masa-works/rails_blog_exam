class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def edit

  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blog_params)
    return render:new if params[:back]
    return redirect_to blogs_path, notice: "ブログを保存しました" if @blog.save
    return render:new
  end

  def update
    return redirect_to blogs_path, notice: "ブログを編集しました" if @blog.update(blog_params)
    return render:edit
  end

  def show

  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render:new if @blog.invalid?
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
