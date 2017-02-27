class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :wechat_openid, index: {unique: true}
      t.json :wechat_userinfo
      t.string :phone, index: true
      t.string :air_auth_token, null: false, index: {unique: true}

      t.string :friends, array: true, default: []
      t.string :status

      t.timestamps
    end
  end
end
