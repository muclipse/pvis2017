class CreateChairAssignments < ActiveRecord::Migration
  def change
    create_table :chair_assignments do |t|
      t.references :chair_group, index: true, foreign_key: true
      t.references :chair, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
