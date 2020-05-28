class CreateMemesTags < ActiveRecord::Migration[6.0]
  def change
    create_table :memes_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :meme, null: false, foreign_key: true
    end
  end
end
