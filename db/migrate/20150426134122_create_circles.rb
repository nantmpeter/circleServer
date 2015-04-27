class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :title
      t.string :desc
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
