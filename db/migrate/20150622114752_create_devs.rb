class CreateDevs < ActiveRecord::Migration
  def change
    create_table :devs do |t|

      t.timestamps null: false
    end
  end
end
