class AddPropertiesToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :properties, :jsonb, null: false, default: '{}'
    add_index  :contacts, :properties, using: :gin
  end
end
