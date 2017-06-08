class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :facebook_id, :limit => 8
      t.string :first_name

      t.timestamps
    end

    add_index(:users, :facebook_id)
  end
end
