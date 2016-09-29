class CreatePropositionHistories < ActiveRecord::Migration
  def change
    create_table :proposition_histories do |t|
      t.integer :print_id
      t.datetime :date
      t.integer :voting_id
      t.integer :transition_id
      t.integer :meeting_point_id
      t.integer :meeting_number
      t.integer :act_number
      t.integer :responsible_person_by_council
      t.integer :responsible_by_chairman
      t.integer :act_number_council
      t.date :publication_at
      t.integer :publication_number_part
      t.integer :publication_number
      t.string :notes
      t.integer :old_id

      t.timestamps null: false
    end
  end
end
