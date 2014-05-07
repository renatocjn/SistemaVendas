class CreateProdutoEmprestados < ActiveRecord::Migration
  def change
    create_table :produto_emprestados do |t|
      t.references :representante
      t.references :produto
	  t.integer :quantidade

      t.timestamps
    end
    add_index :produto_emprestados, :representante_id
    add_index :produto_emprestados, :produto_id
  end
end
