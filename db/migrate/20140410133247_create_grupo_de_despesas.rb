class CreateGrupoDeDespesas < ActiveRecord::Migration
  def change
    create_table :grupo_de_despesas do |t|
      t.string :descricao
      t.date :data_das_despesas
      t.references :usuario

      t.timestamps
    end
    add_index :grupo_de_despesas, :usuario_id
  end
end
