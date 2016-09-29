class CreatePrintStates < ActiveRecord::Migration
  def change
    create_table :print_states do |t|
      t.integer :print_state_type_id
      t.integer :print_type_id
      t.string :description
      t.integer :days_until_next_discussion
      t.integer :days_until_next_discussion_where
      t.integer :old_id

      t.timestamps null: false
    end
  end
end
