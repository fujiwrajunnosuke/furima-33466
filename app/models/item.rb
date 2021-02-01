class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_prefecture
  belongs_to :state
  belongs_to :delivery_price
  belongs_to :user
  has_one_attached :image

  validates :name, :image, :introduction, :price, presence: true
  validates :category_id, :delivery_day_id, :delivery_prefecture_id, :delivery_price_id, :state_id, numericality: { other_than: 1 }   
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000001, message: "is out of setting range"}
end
