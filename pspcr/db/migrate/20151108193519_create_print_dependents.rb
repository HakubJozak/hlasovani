class CreatePrintDependents < ActiveRecord::Migration
  def change
    create_table :print_dependents do |t|
      t.integer :number
      t.integer :number_after_slash
      t.integer :council_history_id
      t.integer :type_id
      t.string :name
      t.string :name_full
      t.datetime :date_of_deliver
      t.integer :organ_id
      t.integer :act_number_organ
      t.integer :responsible_person
      t.string :url
      t.integer :result_id
      t.boolean :is_sorted
      t.integer :state
      t.integer :old_id

      t.timestamps null: false
    end
  end
end
