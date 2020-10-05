class UserCommentsController < ApplicationController

    def new
        @comment = UserComment.new(author_id: current_user.id)
        @user = current_user
        render :new
    end

    def create
        @comment = User.find(params[:user_id]).comments.new(user_comments_params)
        if @comment.save
            redirect_to user_goal(@comment.user_id)
            flash[:notice] = "Comment saved"
        else
            flash.now[:errors] = @comment.errors.full_messages
            render :new
        end
    end

    private

    def user_comments_params
       params.require(:comment).permit(:user_id, :comment)
    end 

end