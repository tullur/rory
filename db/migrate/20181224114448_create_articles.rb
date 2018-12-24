class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :header
      t.string :title
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end
