class CreateVendaItems < ActiveRecord::Migration
  def change
    create_table :venda_items do |t|
      t.references :produto
      t.references :venda
      t.integer :quantidade
      t.float :valor_unit

      t.timestamps
    end
    add_index :venda_items, :produto_id
    add_index :venda_items, :venda_id
  end
end
