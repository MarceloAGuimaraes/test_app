class Product < ApplicationRecord
  belongs_to :category

  validates :description, presence: true

  validates :price, presence: true 

  def full_description
     "#{self.description} Price : #{self.price}"
  end

end
