class CreateDevs < ActiveRecord::Migration
  def change
    create_table :devs do |t|
        t.string :name, null: false
        t.string :email, null: false
        t.integer :access_level, null: false, default: 4

      t.timestamps null: false
    end
    add_index :devs, :access_level
  end
end
