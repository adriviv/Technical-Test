class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.references :listing, null: false, foreign_key: true
      t.integer :price
      t.string :mission_type

      t.timestamps
    end
  end
end
