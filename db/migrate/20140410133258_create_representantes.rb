class CreateRepresentantes < ActiveRecord::Migration
  def change
    create_table :representantes do |t|
      t.string :nome
      t.string :nome_abrev
      t.string :endereco
      t.string :telefone1
      t.string :telefone2

      t.timestamps
    end
  end
end
