class UsersController < ApplicationController
    before_action :set_user, only:[:update, :edit, :show]
    before_action :require_user, only: [:update, :edit]
    before_action :require_same_user, only: [:update, :edit, :show]

    def show
    end

    def new
        @user = User.new
    end

    def edit
    end

    def update
        if @user.update(user_paramss)
            flash[:notice]="You have successfully updated your games"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice]= "Welcome to the Online Games, You've successfully signed up"
            redirect_to login_path
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, game_ids: [])
    end

    def user_paramss
        params.require(:user).permit(:username, game_ids: [])
    end

    def set_user
        @user= User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
            flash[:alert]="You cannot access this account"
            redirect_to current_user
        end
    end

end