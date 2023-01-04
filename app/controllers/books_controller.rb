class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new  
  end
  
   def create
     
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
    
  end
  
  def self.errors
  end

  def index
    #@book = Book.new  
    @book = Book.all  
    
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
     @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path(book.id)  
  end
  
 def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  
   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

