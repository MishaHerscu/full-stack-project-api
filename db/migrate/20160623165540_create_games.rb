#
class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.string :opponent
      t.string :won
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
