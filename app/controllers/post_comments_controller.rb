class PostCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = PostComment.new
    @comment = PostComment.create(post_comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_back(fallback_location: root_path) } 
        format.js  
      else
        format.html { redirect_back(fallback_location: root_path) } 
      end
    end
  end
  
  
  def destroy
    @book = Book.find(params[:book_id])
    @comment = current_user.post_comments.find(params[:id])
    @comment.destroy
  end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment).merge(user_id: current_user.id, book_id: params[:book_id])
  end
  
end
