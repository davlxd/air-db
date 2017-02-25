class CreateSmsMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :sms_messages, id: :uuid do |t|
      t.string :phone
      t.string :ver_code
      t.string :body

      t.timestamps
    end
  end
end
