class CreateCustomFields < ActiveRecord::Migration[6.0]
  def change
    create_table :custom_fields, id: :uuid do |t|
      t.references :account, null: false, type: :uuid, foreign_key: true
      t.string :label
      t.string :variant

      t.timestamps
    end
  end
end
