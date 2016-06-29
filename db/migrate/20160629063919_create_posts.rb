#
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :player, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
