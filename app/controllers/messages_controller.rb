class MessagesController < ApplicationController
    def create 
        cur_usrId = current_user.id
        cur_msg = params[:message]
        @user = User.find_by(id: cur_usrId)
        @user.messages.create(body: cur_msg)
     
        
        redirect_to root_path


    end
end
