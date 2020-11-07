class CommentBroadcastJob < ApplicationJob
    queue_as :default

  def perform(counter,comment)
    ActionCable.server.broadcast 'comment_channel',  counter: render_counter(counter), comment: render_comment(comment)
  end

  private

  def render_counter(counter)
    ApplicationController.renderer.render(partial: 'comments/counter', locals: { counter: counter })
  end

  def render_comment(comment)
    ApplicationController.renderer.render(partial: 'comments/comment', locals: { comment: comment })
  end

end
