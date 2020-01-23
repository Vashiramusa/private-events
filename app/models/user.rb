class User < ApplicationRecord
  has_many :created_events, class_name: "Event"
  has_many :attendances
  has_many :attending_events, through: :attendances, source: :event


  def join_event(event)
    return false if attending_events.include? event

    attending_events << event
  end

end
