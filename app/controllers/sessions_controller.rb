class SessionsController < ApplicationController

    before_action :already_logged_in?, only: [:new,:edit]

    def new 
        @user = User.new 
    end

    def create
        p "hye the req jihit" 
        
       user = User.find_by(username: params[:username])
       pass = params[:password]
       if user && user.authenticate(pass)
            session[:user_id] = user.id 
            flash[:notice] = "logged In"
            redirect_to root_path
       else
            p "wrong password"
            flash[:notice] = "Wrong password"
            redirect_to login_path
       end

    end

    def destroy 
       
        session[:user_id] = nil 
        flash[:notice] = "Logged Out"
        redirect_to login_path
    end

    private 
    def already_logged_in?
        if logged_in? 
            redirect_to root_path
        end
    end
    
end
