class GoalsController < ApplicationController
    before_action :check_user, only: [:edit, :destroy]

    def index
        @goals = current_user.goals
        render :index
    end

    def new
        @goal = Goal.new(user_id: current_user.id)
        @user = current_user
        render :new
    end

    def create
        @goal = current_user.goals.new(goal_params)
        if @goal.save
            redirect_to user_goals_path
            flash[:notice] = "Goal saved"
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :new
        end
    end

    def update
        @goal = Goal.find_by(id: params[:id])
        if @goal.update(goal_params)
            redirect_to user_goals_path
            flash[:notice] = "Goal updated"
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :edit
        end
    end

    def edit
        @goal = Goal.find_by(id: params[:id])
        @user = User.find_by(id: params[:user_id])
        render :edit
    end

    def destroy
        @goal = Goal.find_by(id: params[:id])
        @goal.destroy
        redirect_to user_goals_path
        flash[:notice] = "Goal deleted"
    end

    def homepage
        @goals = Goal.all
        render :index
    end

    private

    def goal_params
       params.require(:goal).permit(:goal_title, :description, :completed, :public)
    end 

    def check_user
        @user = Goal.find_by(id: params[:id]).user
        unless current_user == @user
            redirect_to user_goals_path, notice: 'Incorrect user'
        end
    end
end