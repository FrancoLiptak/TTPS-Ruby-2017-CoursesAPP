class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.references :courses, foreign_key: true
      t.string :last_name
      t.string :name
      t.integer :dni
      t.string :student_number
      t.string :email

      t.timestamps
    end
  end
end
