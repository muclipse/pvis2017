class CreatePreviousConferences < ActiveRecord::Migration
  def change
    create_table :previous_conferences do |t|
      t.integer :year
      t.string :location
      t.string :country
      t.string :url
      t.date :from
      t.date :to
      t.timestamps null: false
    end

    add_index :previous_conferences, :year, unique: true
  end
end
