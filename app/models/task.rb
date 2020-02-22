class Task < ApplicationRecord
  has_many :sub_tasks, dependent: :destroy
  validates :text, presence: true, length: { minimum: 5 }
end
