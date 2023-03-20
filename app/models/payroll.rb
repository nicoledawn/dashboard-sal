class Payroll < ApplicationRecord
  validates :user_id, presence: true

  has_one_attached :file
  belongs_to :user
end
