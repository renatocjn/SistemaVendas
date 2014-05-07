class CreateMovimentacaoDeEstoques < ActiveRecord::Migration
  def change
    create_table :movimentacao_de_estoques do |t|
      t.string :observacoes
      t.integer :quantidade
      t.references :tipo_de_movimentacao
      t.references :produto
      t.references :representante
      t.references :usuario
      t.date :dataDaMovimentacao

      t.timestamps
    end
    add_index :movimentacao_de_estoques, :tipo_de_movimentacao_id
    add_index :movimentacao_de_estoques, :produto_id
    add_index :movimentacao_de_estoques, :representante_id
    add_index :movimentacao_de_estoques, :usuario_id
  end
end
