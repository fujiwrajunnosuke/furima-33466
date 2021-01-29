class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_prefecture
  belongs_to :state
  belongs_to :delivery_price
  belongs_to :user
  has_one_attached :image


end
