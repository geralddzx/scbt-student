class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :session_token, null: false

      t.timestamps
    end
  end
end
