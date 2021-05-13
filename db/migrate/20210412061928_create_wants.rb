class CreateWants < ActiveRecord::Migration[6.0]
  def change
    create_table :wants do |t|
      t.string :title, null: false
      t.string :text, limit: 1000, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
