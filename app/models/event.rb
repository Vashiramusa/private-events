class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :attendances 
  has_many :attendees, through: :attendances, source: :user

  validates :date, presence: true
  validates :title, presence: true, length: {maximum: 30}
  validates :description, presence: true, length: {maximum: 250}


  scope :past, -> {where('date < ?', Time.now)}
  scope :future, -> {where('date >= ?', Time.now)}
end
