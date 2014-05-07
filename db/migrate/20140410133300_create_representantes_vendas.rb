class CreateRepresentantesVendas < ActiveRecord::Migration
  def change
    create_table :representantes_vendas do |t|
      t.references :representante
      t.references :venda

      t.timestamps
    end
    add_index :representantes_vendas, :representante_id
    add_index :representantes_vendas, :venda_id
  end
end
