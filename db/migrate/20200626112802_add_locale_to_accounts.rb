class AddLocaleToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :locale, :string
  end
end
