class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    #belongs_to an user
    @message.user = current_user
    #belongs_to an chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message.chatroom = @chatroom
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: 'messages/message', locals: { message: @message })
      )
      redirect_to(chatroom_path(@chatroom))
    else
      render 'chatrooms/show'
    end

  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
