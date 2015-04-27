class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :sign
      t.string :title
      t.text :content
      t.integer :genre
      t.integer :user_id
      t.text :url
      t.integer :status

      t.timestamps null: false
    end
  end
end
