class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :url
      t.integer :user_id
      t.integer :circle_id

      t.timestamps null: false
    end
  end
end
