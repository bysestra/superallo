class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.uuid :creator_id, index: true
      t.uuid :commentable_id, index: true
      t.references :account, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
