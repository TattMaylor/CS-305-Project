class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.boolean :activity
      t.boolean :super

      t.timestamps null: false
    end
  end
end
