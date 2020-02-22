class Task < ApplicationRecord
  has_many :sub_tasks
  validates :text, presence: true, length: { minimum: 5 }
end
