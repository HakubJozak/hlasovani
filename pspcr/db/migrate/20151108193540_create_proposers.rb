class CreateProposers < ActiveRecord::Migration
  def change
    create_table :proposers do |t|
      t.integer :print_id
      t.integer :person_id
      t.integer :index
      t.integer :type

      t.timestamps null: false
    end
  end
end
