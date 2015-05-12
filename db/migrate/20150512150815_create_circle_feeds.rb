class CreateCircleFeeds < ActiveRecord::Migration
  def change
    create_table :circle_feeds do |t|
      t.integer :circle_id
      t.integer :feed_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
