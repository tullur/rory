class UserController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    def index; end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user_id
            redirect_to user_path(@user), success: "Welcome #{@user.username}"
        else
            render 'new'
        end
    end

    def edit; end

    def update
        if @user.update(user_params)
            redirect_to articles_path, success: "Account information was successfully updated"
        else
            render 'edit'
        end
    end

    def show; end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to user_path, danger: "All user data was deleted"
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permite(:username, :email, :password)
    end

    def require_same_user; end

    def require_admin; end
end
