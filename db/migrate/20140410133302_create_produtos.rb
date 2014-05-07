class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.integer :estoque

      t.timestamps
    end
  end
end
