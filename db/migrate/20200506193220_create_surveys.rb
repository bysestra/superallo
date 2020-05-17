class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys, id: :uuid do |t|
      t.references :account, null: false, type: :uuid, foreign_key: true
      t.string :name
      t.text :template

      t.timestamps
    end
  end
end
