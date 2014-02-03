class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :code
      t.string :name
      t.integer :create_user_id
      t.integer :update_user_id

      t.timestamps
    end
  end
end
