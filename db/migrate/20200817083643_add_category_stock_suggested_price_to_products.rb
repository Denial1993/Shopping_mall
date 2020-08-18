class AddCategoryStockSuggestedPriceToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column	:products,:category,:string
  	add_column	:products,:stock,:integer
  	add_column	:products,:suggested_price,:integer
  end
end
