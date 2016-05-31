class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.string :name
      t.string :email
      t.string :affiliation

      t.timestamps null: false
    end
  end
end
