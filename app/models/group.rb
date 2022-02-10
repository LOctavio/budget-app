class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :products
  has_one_attached :icon, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  def total_amount
    total = 0.0
    products.each do |product|
      total += product.amount
    end
    total
  end
end
