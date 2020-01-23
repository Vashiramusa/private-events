class User < ApplicationRecord
  has_many :created_events, class_name: "Event"
  has_many :attendances
  has_many :attending_events, through: :attendances, source: :event
end
