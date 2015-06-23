class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
        t.belongs_to :dev
        t.string :uid
        t.string :provider

      t.timestamps null: false
    end
    add_index :identities, :dev_id
    add_index :identities, :provider
  end
end
