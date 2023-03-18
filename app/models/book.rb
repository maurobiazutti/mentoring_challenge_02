class Book < ApplicationRecord
  belongs_to :author
  has_many :assemblies, inverse_of: :part, dependent: :destroy
  has_many :parts, :through => :assemblies, dependent: :destroy

  validates :isbn,   :isbn_format => true
  #validates :isbn10, :isbn_format => { :with => :isbn10 }
  #validates :isbn13, :isbn_format => { :with => :isbn13 }

  scope :search, ->(query){ joins(:author)
                              .where("(authors.name) like ?", "%#{query}%")
                              .or(where("title like ?", "%#{query}%")) }

  accepts_nested_attributes_for :assemblies, reject_if: :all_blank,  allow_destroy: true

end
