class MessagesController < ApplicationController
	before_action :authenticate_user!
	
	def new
		
	end
	
	def create
    receivers = User.where(id: params['receivers'])
    conversation = current_user.send_message(receivers, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end
