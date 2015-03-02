class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :name, null: false
      t.integer :team1, null: false
      t.integer :team2, null: false
      t.integer :region_id, null: false
      t.date :date_played, null: false
      t.string :video_url, null: false

      t.timestamps null: false
    end
  end
end
