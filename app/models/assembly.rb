class Assembly < ApplicationRecord
  belongs_to :book
  belongs_to :part

  accepts_nested_attributes_for :part,  allow_destroy: true

  scope :search, ->(query){joins(:part).where("name like ?", "%#{query}%")}

end
