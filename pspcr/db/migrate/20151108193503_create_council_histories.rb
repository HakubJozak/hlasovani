class CreateCouncilHistories < ActiveRecord::Migration
  def change
    create_table :council_histories do |t|
      t.integer :print_id
      t.integer :organ_id
      t.integer :type
      t.integer :proposition_history_id
      t.integer :responsible_person_id
      t.integer :index

      t.timestamps null: false
    end
  end
end
