class MessagesController < ApplicationController
    def create 
        cur_usrId = current_user.id
        cur_msg = params[:message]
        @user = User.find_by(id: cur_usrId)
        if @user.messages.create(body: cur_msg)
            ActionCable.server.broadcast "chatroom_channel" , {name:@user.username ,msg: cur_msg}
        end
        redirect_to root_path 
    end
end
