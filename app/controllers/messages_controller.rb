class MessagesController < ApplicationController
	def create
	    person = User.find(params[:person_id])
	    comment2 = current_user.messages.new(message_params)
	    comment2.person_id = person.id
	    comment2.writer_id = current_user.id
	    comment2.save
	    redirect_to user_path(person.id)
	end

	private
	def message_params
	  params.require(:message).permit(:person_id,
	                      :sideperson_id,
	                      :sidecomment)
	end
end
