class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :memes, table_name: :comments, column_options: { null: false, foreign_key: true } do |t|
      t.text :body, null: false
      t.index [:user_id, :meme_id]

      t.timestamps
    end
  end
end
