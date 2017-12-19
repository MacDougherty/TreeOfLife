class CommandChannel < ApplicationCable::Channel
  def subscribed
    stream_from "command_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end