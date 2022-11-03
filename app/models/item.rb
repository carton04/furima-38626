class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :duration_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :duration_id
  end

  validates_inclusion_of :price, in: 300..9999999
  validates :price, numericality: { with: /\A[0-9]+\z/}

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :duration

end