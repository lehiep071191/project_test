class CommentsChannel < ApplicationCable::Channel
  def subscribed
     stream_from "comments:#{current_user.id}"
  end

  def unsubscribed
     	stop_all_streams
  end
end
