class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    # テーブルが存在しない場合のみ作成
    create_table :users, if_not_exists: true do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
