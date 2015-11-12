class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :degree_pre
      t.string :degree_post
      t.date :born_at
      t.date :died_at
      t.string :gender
      t.integer :artificial_id

      t.timestamps null: false
    end
  end
end
