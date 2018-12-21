class SessionsController < ApplicationController
    def new; end       
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to about_path, notice: "You have successfully logged in"
        else 
            redirect_to login_path, notice: "Something wrong with your login information"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "You have successfully logged out"
    end
end
