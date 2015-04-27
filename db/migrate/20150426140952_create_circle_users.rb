class CreateCircleUsers < ActiveRecord::Migration
  def change
    create_table :circle_users do |t|
      t.integer :circle_id
      t.integer :user_id
      t.integer :invite_user_id

      t.timestamps null: false
    end
  end
end
