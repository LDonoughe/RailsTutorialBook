class CreatePosts < ActiveRecord::Migration[4.2]
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.string :title
      t.string :body

      t.timestamps null: false
     end
  end
end
