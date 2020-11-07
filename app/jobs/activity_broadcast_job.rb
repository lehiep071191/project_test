class ActivityBroadcastJob < ApplicationJob
  queue_as :default

  def perform(counter)
    ActionCable.server.broadcast 'activity_channel',  counter: render_counter(counter)
  end

  private

  def render_counter(counter)
    ApplicationController.renderer.render(partial: 'activities/counter', locals: { counter: counter })
  end
end
