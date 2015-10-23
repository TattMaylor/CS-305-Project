class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
	  t.string :firstname
      t.string :lastname
      t.string :sid
      t.string :password
      t.string :enrollment

      t.timestamps null: false
    end
  end
end
