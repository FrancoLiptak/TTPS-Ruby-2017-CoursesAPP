class CreateEvaluationInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluation_instances do |t|
      t.references :courses, foreign_key: true
      t.string :title
      t.date :date
      t.integer :passing_core

      t.timestamps
    end
  end
end
