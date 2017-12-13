class CreateEvaluationInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluation_instances do |t|
      t.references :course, foreign_key: true
      t.string :title
      t.date :date
      t.integer :passing_score
      t.integer :top_score
      
      t.timestamps
    end
  end
end
