class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.belongs_to :dev, null: false
      t.string :name, null: false
      t.integer :secret_id, null: false
      t.string :secret_key, null: false
      t.integer :access_level, null: false, default: 4

      t.timestamps null: false
    end
    add_index :apps, :access_level
    add_index :apps, :dev_id
  end
end
