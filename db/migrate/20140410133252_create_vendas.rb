class CreateVendas < ActiveRecord::Migration
  def change
    create_table :vendas do |t|
      t.date :data_da_venda
      t.string :resposavel_pela_venda
      t.references :cliente
      t.references :usuario
	  t.references :representante

      t.timestamps
    end
    add_index :vendas, :cliente_id
    add_index :vendas, :usuario_id
	add_index :vendas, :representante_id
  end
end
