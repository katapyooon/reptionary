class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    # テーブルが存在しない場合のみ作成
    create_table :users, if_not_exists: true do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
