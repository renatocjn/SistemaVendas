class CreateTipoDeMovimentacaos < ActiveRecord::Migration
  def change
    create_table :tipo_de_movimentacaos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
