class Product < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :author, class_name: 'User'
end
