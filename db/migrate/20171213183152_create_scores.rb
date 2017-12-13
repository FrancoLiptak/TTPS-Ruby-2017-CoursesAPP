class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :evaluation_instance, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
