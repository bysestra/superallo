class AddChoicesToCustomFields < ActiveRecord::Migration[6.0]
  def change
    add_column :custom_fields, :choices, :string
  end
end
