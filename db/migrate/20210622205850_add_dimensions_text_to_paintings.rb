class AddDimensionsTextToPaintings < ActiveRecord::Migration[5.2]
  def change
    add_column :paintings, :dimensions_text, :string
  end
end
