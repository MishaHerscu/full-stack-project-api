#
class CreateAssists < ActiveRecord::Migration
  def change
    create_table :assists do |t|
      t.references :player, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
