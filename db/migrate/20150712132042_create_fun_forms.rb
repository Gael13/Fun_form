class CreateFunForms < ActiveRecord::Migration
  def change
    create_table :fun_forms do |t|
      t.string :quest1
      t.string :quest2
      t.string :quest3
      t.string :quest4

      t.timestamps null: false
    end
  end
end
