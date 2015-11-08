class CreatePrintTransitions < ActiveRecord::Migration
  def change
    create_table :print_transitions do |t|
      t.integer :from_state_id
      t.integer :to_state_id
      t.integer :action_id
      t.integer :transition_type
      t.integer :old_id

      t.timestamps null: false
    end
  end
end
