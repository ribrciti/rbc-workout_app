class Exercise < ApplicationRecord
  belongs_to :user

  validates_presence_of :duration_in_min, numericality: :true
  validates_presence_of :workout
  validates_presence_of :workout_date, numericality: :true
  validates_presence_of :user_id

  #default_scope { where( 'workout_date > ?', 7.days.ago).order( workout_date: :desc ) }
  default_scope { where( 'workout_date <= ? AND workout_date >= ?', Date.today, 8.days.ago ) }
end
