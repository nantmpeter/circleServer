class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :code
      t.integer :user_id
      t.integer :num
      t.integer :circle_id

      t.timestamps null: false
    end
  end
end
