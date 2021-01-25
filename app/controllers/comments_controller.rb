class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
      if @comment.save
          # コメントが保存された場合の処理
        redirect_to "/prototypes/#{@comment.prototype.id}"
      else
   # コメントの保存に失敗した場合の処理
        @prototype = Prototype.find(params[:prototype_id])
        @comment = Comment.new
        @comments = @prototype.comments.includes(:user)
        render "prototypes/show"
      
      end
    end
  
    private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    end
  end