class CreateCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :calls, id: :uuid do |t|
      t.references :account, null: false, type: :uuid, foreign_key: true, index: true
      t.uuid :creator_id, index: true
      t.uuid :callee_id, index: true
      t.string :from_number
      t.string :to_number
      t.integer :status, default: 0
      t.integer :direction, default: 0
      t.integer :duration_in_seconds
      t.float :price

      t.timestamps
    end
  end
end
