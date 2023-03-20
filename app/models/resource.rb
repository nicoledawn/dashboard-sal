class Resource < ApplicationRecord
  validates :category_id, presence: true
  
  has_one_attached :document,  dependent: :destory do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
belongs_to :category
  
end
