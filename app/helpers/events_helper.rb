module EventsHelper

  def attending?(event)
    current_user.attending_events.include?(event)
  end

  def events_any?
    @future.any? || @past.any?
  end
end
