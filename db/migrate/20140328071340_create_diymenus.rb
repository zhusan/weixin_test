class CreateDiymenus < ActiveRecord::Migration
  def change
    create_table :diymenus do |t|
      t.integer :public_account_id
      t.integer :parent_id
      t.string :name
      t.string :key
      t.boolean :is_show
      t.string :url

      t.timestamps
    end
    add_index :diymenus, :public_account_id
    add_index :diymenus, :parent_id
    add_index :diymenus, :key
  end
end
