class ChatroomChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    # puts params
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
    # stream_from "chatroom_#{chatroom.id}" # radio frequency
    # stream_from 'some_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
