class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :company_name
      t.string :phone_number
      t.string :email_address
      t.references :account, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
