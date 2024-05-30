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
            if user.session_token.present?
                print "User already logged in. Please log out from other sessions."
                flash[:notice] = "User already logged in. Please log out from other sessions."
                redirect_to login_path
            
            else 
                session[:user_id] = user.id 
                user.generate_session_token!
                session[:session_token] = user.session_token
                flash[:notice] = "logged In"
                redirect_to root_path
            end
       else
            p "wrong password"
            flash[:notice] = "Wrong password"
            redirect_to login_path
       end

    end

    def destroy 
        current_user.invalidate_session! if current_user
        session[:user_id] = nil 
        session[:session_token] = nil
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
