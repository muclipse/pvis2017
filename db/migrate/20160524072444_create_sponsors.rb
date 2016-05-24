class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.integer :position
      t.string :name
      t.string :url
      t.string :sponsor_type

      t.timestamps null: false
    end
  end
end
