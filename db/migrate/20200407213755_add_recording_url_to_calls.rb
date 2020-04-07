class AddRecordingUrlToCalls < ActiveRecord::Migration[6.0]
  def change
    add_column :calls, :recording_url, :string
  end
end
