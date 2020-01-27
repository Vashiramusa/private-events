class User < ApplicationRecord
  has_many :created_events, class_name: 'Event'
  has_many :attendances
  has_many :attending_events, through: :attendances, source: :event

  validates :name, presence: true, length: { minimum: 5 }
  validates :username, presence: true, length: { minimum: 5 }

  def join_event(event)
    return false if attending_events.include? event

    attending_events << event
  end

  def leave_event(event)
    return false unless attending_events.include? event

    attending_events.destroy event
  end
end
