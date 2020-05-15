class AddFollowUpDateToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :follow_up_date, :date
  end
end
