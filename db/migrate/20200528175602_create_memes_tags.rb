class CreateMemesTags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :memes, :tags, column_options: { null: false, foreign_key: true } do |t|
      t.index [:meme_id, :tag_id]
    end
  end
end
