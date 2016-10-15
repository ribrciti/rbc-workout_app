class Exercise < ApplicationRecord
  belongs_to :user

   scope :exercises_by, ->(user) { where(user_id: user.id) }
end
