class CreateSecrets < ActiveRecord::Migration[7.1]
  def change
    create_table :secrets do |t|
      t.text :message
      t.boolean :shared, default: false
      t.boolean :burned, default: false
      t.datetime :burned_at
      t.string :token
      t.string :algo_name

      t.timestamps
    end

    add_index :secrets, :token, unique: true
  end
end
