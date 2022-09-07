class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
