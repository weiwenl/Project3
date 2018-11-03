class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    #any cleanup when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message']
  end
end
