class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.references :tipo_de_pagamento
      t.references :venda
      t.float :valor
      t.date :data_de_entrada
      t.date :data_do_pagamento

      t.timestamps
    end
    add_index :pagamentos, :tipo_de_pagamento_id
    add_index :pagamentos, :venda_id
  end
end
