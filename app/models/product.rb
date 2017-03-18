class Product < ApplicationRecord
  validates :title, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :category

  has_many :groupships
  has_many :groups, through: :groupships
end
