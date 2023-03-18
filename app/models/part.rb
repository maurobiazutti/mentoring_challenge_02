class Part < ApplicationRecord
  belongs_to :provider
  has_many :assemblies, inverse_of: :book, dependent: :destroy
  has_many :books, :through => :assemblies, dependent: :destroy
end
