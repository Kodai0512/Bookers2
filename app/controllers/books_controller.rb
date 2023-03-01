class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  
  # 投稿データの保存
  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id) 
  else
     @books=Book.all
     @user=current_user
         render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  if @book.user_id !=current_user.id
    redirect_to books_path
  end  
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)  
     else
         render :edit
    end
  end


  def index
     @book= Book.new
     @books=Book.all
     @user=current_user
  end
  

  def show 
    @book = Book.find(params[:id]) 
    @books = Book.new
    @user = @book.user
  end

  def destroy
   book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一
  end

  
  # 投稿データのストロングパラメータ
  private

  def books_params
    params.require(:book).permit(:title,:body)
  end
end
