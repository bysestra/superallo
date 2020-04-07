class AddExternalIdToCalls < ActiveRecord::Migration[6.0]
  def change
    add_column :calls, :external_id, :string
  end
end
