class AddAccountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :account, type: :uuid, index: true, foreign_key: true
  end
end
