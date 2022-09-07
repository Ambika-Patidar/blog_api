class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_user_id
      t.integer :status

      t.timestamps
    end
  end
end
