class Account < ApplicationRecord
  belongs_to :provider
  validate :valid_digit?

  scope :search, ->(query){Account.where("account_number like ?", "%#{query}%")}

  end

class CheckAccountDigit
  def initialize(cont, digi)
       @account_number = cont.to_s
    @digit = digi.to_s
  end
  def check_digit?
    i = @account_number.size + 1
    j = 0
    sum_product = 0
    while i > 1
      sum_product += @account_number[j].to_i * i
      i -= 1
      j += 1
    end
    dig = sum_product % 11
    dig = 11 - dig
    if dig == 10
      dig = "X"
    elsif dig == 11
      dig == 0
    else
      dig
    end
    @digit.to_s == dig.to_s
  end
end

def valid_digit?
  d = CheckAccountDigit.new(account_number, digit)
  errors.add(:digit, "Dígito verificador inválido! Por favor, verifique os dados.") unless d.check_digit?
end