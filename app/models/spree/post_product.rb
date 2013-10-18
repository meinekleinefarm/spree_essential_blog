class Spree::PostProduct < ActiveRecord::Base

  belongs_to :post
  belongs_to :product

  validates_associated :post
  validates_associated :product

  attr_accessible :post_id, :product_id, :position

end