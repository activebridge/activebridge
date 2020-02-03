class AddImgAltTextToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :img_alt_text, :string
  end
end
