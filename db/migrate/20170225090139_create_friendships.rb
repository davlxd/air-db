class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships, id: :uuid do |t|
      t.uuid :requester_id, index: true
      t.uuid :acceptor_id, index: true
      t.foreign_key :users, column: :requester_id
      t.foreign_key :users, column: :acceptor_id
      t.string :status

      t.index [:requester_id, :acceptor_id], unique: true

      t.timestamps
    end
  end
end
