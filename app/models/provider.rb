class Provider < ApplicationRecord
  has_one :account, dependent: :destroy
  has_many :parts, dependent: :destroy

  validates :cnpj, :cnpj => true

  scope :search, ->(query){Provider.where("name like?", "%#{query}%")}
  # scope :search, ->(query){joins(:author).where("name like ?", "%#{query}%")}
end
