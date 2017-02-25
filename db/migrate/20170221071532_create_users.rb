class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :wechat_openid
      t.json :wechat_userinfo
      t.string :phone
      t.string :air_auth_token, null: false
      t.string :status

      t.timestamps
    end
  end
end
