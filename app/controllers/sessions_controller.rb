class SessionsController < ApplicationController
    def new; end       
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "You have successfully logged in"
            redirect_to about_path
        else
            flash.now[:notice] = "Something wrong with your login information"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have successfully logged out"
        redirect_to root_path
    end
end
