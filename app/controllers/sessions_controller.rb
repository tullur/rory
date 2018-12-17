class SessionsController < ApplicationController
    def new; end       
    
    def create
        user = User.find_by(email: params[:logins][:email].downcase)
        if user && user.authenticate(params[:logins][:password])
            session[:user_id] = user.id
            flash[:notice] = "You have successfully logged in"
            redirect_to user
        else
            flash.now[:notice] = "Something wrong with your login information"
            render 'new'
        end
    end

    def destroy
        session[:student_id] = nil
        flash[:notice] = "You have successfully logged out"
        redirect_to root_path
    end
end
