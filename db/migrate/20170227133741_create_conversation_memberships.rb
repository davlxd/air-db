class CreateConversationMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_memberships, id: :uuid do |t|
      t.references :conversation, type: :uuid, index: true, foreign_key: true
      t.references :user, type: :uuid, index: true, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
