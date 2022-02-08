class Product < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :amount, comparison: { greater_than: 0 }
  validates :groups, :length => { :minimum => 1 }
end
