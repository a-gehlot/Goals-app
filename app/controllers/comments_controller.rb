class CommentsController < ApplicationController


    def create
        @comment = Comment.new(comments_params)
        @comment.author_id = current_user.id
        if @comment.save
            redirect_back(fallback_location: root_path)
            flash[:notice] = "Comment saved"
        else
            flash.now[:errors] = @comment.errors.full_messages
        end
    end

    private

    def comments_params
       params.require(:comment).permit(:commentable_id, :commentable_type, :comment_text)
    end 


end