class CreateChairGroups < ActiveRecord::Migration
  def change
    create_table :chair_groups do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
