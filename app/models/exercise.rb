class Exercise < ApplicationRecord
  belongs_to :user

  validates_presence_of :duration_in_min, numericality: :true
  validates_presence_of :workout
  validates_presence_of :workout_date, numericality: :true
  validates_presence_of :user_id

  scope :exercises_by, ->(user) { where(user_id: user.id) }
  default_scope { where( 'workout_date > ?', 7.days.ago ).order( workout_date: :desc ) }
end
