class RenameDigitoVerificadoToAccountNumber < ActiveRecord::Migration[7.0]
  def change
    rename_column :accounts, :digito_verificado, :account_number
  end
end
