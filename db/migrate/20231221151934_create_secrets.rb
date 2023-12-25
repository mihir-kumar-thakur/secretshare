class CreateSecrets < ActiveRecord::Migration[7.1]
  def change
    create_table :secrets do |t|
      t.text :content
      t.boolean :shared, default: false
      t.boolean :viewed, default: false
      t.string :access_token
      t.string :algo_name

      t.timestamps
    end

    add_index :secrets, :access_token, unique: true
  end
end
