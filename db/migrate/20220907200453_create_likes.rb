class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :likeable, polymorphic: true

      t.timestamps
    end
  end
end
