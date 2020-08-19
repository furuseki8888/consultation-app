class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname, null:false
      t.integer :prefecture_id
      t.text :introduction
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
