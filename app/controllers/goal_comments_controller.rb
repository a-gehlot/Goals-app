class GoalCommentsController < ApplicationController

    def new
        @comment = GoalComment.new(author_id: current_user.id, goal_id: params[:id])
        render :new
    end

    def create
        @comment = Goal.find(params[:id]).comments.new(user_comments_params)
        if @comment.save
            redirect_to goals
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