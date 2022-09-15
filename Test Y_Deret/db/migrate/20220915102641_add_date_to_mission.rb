class AddDateToMission < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :date, :date
  end
end
