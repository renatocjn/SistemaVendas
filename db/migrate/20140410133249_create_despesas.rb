class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.string :descricao
      t.float :valor
      t.references :grupo_de_despesa

      t.timestamps
    end
    add_index :despesas, :grupo_de_despesa_id
  end
end
