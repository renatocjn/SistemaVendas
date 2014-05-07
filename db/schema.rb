# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140410171859) do

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "nome_abrev"
    t.string   "endereco"
    t.string   "telefone1"
    t.string   "telefone2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "despesas", :force => true do |t|
    t.string   "descricao"
    t.float    "valor"
    t.integer  "grupo_de_despesa_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "despesas", ["grupo_de_despesa_id"], :name => "index_despesas_on_grupo_de_despesa_id"

  create_table "grupo_de_despesas", :force => true do |t|
    t.string   "descricao"
    t.date     "data_das_despesas"
    t.integer  "usuario_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "grupo_de_despesas", ["usuario_id"], :name => "index_grupo_de_despesas_on_usuario_id"

  create_table "movimentacao_de_estoques", :force => true do |t|
    t.string   "observacoes"
    t.integer  "quantidade"
    t.integer  "tipo_de_movimentacao_id"
    t.integer  "produto_id"
    t.integer  "representante_id"
    t.integer  "usuario_id"
    t.date     "dataDaMovimentacao"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "movimentacao_de_estoques", ["produto_id"], :name => "index_movimentacao_de_estoques_on_produto_id"
  add_index "movimentacao_de_estoques", ["representante_id"], :name => "index_movimentacao_de_estoques_on_representante_id"
  add_index "movimentacao_de_estoques", ["tipo_de_movimentacao_id"], :name => "index_movimentacao_de_estoques_on_tipo_de_movimentacao_id"
  add_index "movimentacao_de_estoques", ["usuario_id"], :name => "index_movimentacao_de_estoques_on_usuario_id"

  create_table "pagamentos", :force => true do |t|
    t.integer  "tipo_de_pagamento_id"
    t.integer  "venda_id"
    t.float    "valor"
    t.date     "data_de_entrada"
    t.date     "data_do_pagamento"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "pagamentos", ["tipo_de_pagamento_id"], :name => "index_pagamentos_on_tipo_de_pagamento_id"
  add_index "pagamentos", ["venda_id"], :name => "index_pagamentos_on_venda_id"

  create_table "produto_emprestados", :force => true do |t|
    t.integer  "representante_id"
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "produto_emprestados", ["produto_id"], :name => "index_produto_emprestados_on_produto_id"
  add_index "produto_emprestados", ["representante_id"], :name => "index_produto_emprestados_on_representante_id"

  create_table "produtos", :force => true do |t|
    t.string   "descricao"
    t.integer  "estoque"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "representantes", :force => true do |t|
    t.string   "nome"
    t.string   "nome_abrev"
    t.string   "endereco"
    t.string   "telefone1"
    t.string   "telefone2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "representantes_vendas", :force => true do |t|
    t.integer  "representante_id"
    t.integer  "venda_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "representantes_vendas", ["representante_id"], :name => "index_representantes_vendas_on_representante_id"
  add_index "representantes_vendas", ["venda_id"], :name => "index_representantes_vendas_on_venda_id"

  create_table "tipo_de_movimentacaos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_de_pagamentos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "username",               :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true
  add_index "usuarios", ["username"], :name => "index_usuarios_on_username", :unique => true

  create_table "venda_items", :force => true do |t|
    t.integer  "produto_id"
    t.integer  "venda_id"
    t.integer  "quantidade"
    t.float    "valor_unit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "venda_items", ["produto_id"], :name => "index_venda_items_on_produto_id"
  add_index "venda_items", ["venda_id"], :name => "index_venda_items_on_venda_id"

  create_table "vendas", :force => true do |t|
    t.date     "data_da_venda"
    t.string   "resposavel_pela_venda"
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.integer  "representante_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "vendas", ["cliente_id"], :name => "index_vendas_on_cliente_id"
  add_index "vendas", ["representante_id"], :name => "index_vendas_on_representante_id"
  add_index "vendas", ["usuario_id"], :name => "index_vendas_on_usuario_id"

end
