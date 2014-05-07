class CreateTipoDePagamentos < ActiveRecord::Migration
  def change
    create_table :tipo_de_pagamentos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
