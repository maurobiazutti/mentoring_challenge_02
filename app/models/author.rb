class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, :cpf, presence: true
  validates :name, :cpf, uniqueness: true
  validates :cpf, :cpf => true

  # accepts_nested_attributes_for :books
end
