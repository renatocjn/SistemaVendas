# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in 1..3
	u = Usuario.create(username: 'user' + i.to_s, password:'password'+i.to_s, email:'user'+i.to_s+'@users.com')
end
users = Usuario.all
puts "gerados #{users.size} usuarios"

for fn in ['renato', 'caio', 'felipe', 'lucas']
	for ln in ['eduardo', 'becker', 'johnson', 'hoversaw']
		curr_name = fn + ' ' + ln
		curr_name_abrv = fn[0..2] + ln[0..2]
		ender = 'Rua ...'
		tel1 = '(85)8888-8888'
		tel2 = '(85)9999-9999'

		Cliente.create(nome: curr_name, nome_abrev: curr_name_abrv, endereco: ender, telefone1: tel1, telefone2: tel2)
	end
end
clients = Cliente.all
puts "gerados #{clients.size} clientes"

produtos = ['carro', 'moto', 'charuto', 'porcelana', 'vidracaria', 'frango empanado', 'espeto de gato', 'protetor solar fator -1', 'pitomba', 'pasta de amendoim']
for p in produtos
	Produto.create(descricao: p, estoque: rand(50..100))
end
products = Produto.all
puts "gerados #{products.size} produtos"

tiposDePagamento = ['dinheiro', 'cheque']
for t in tiposDePagamento
	TipoDePagamento.create(descricao: t)
end
puts "gerados #{TipoDePagamento.all.size} tiposDePagamento"

for fn in ['geraldo', 'carlos']
	for ln in ['fernandes', 'feliciano']
		r = Representante.create(nome: fn+' '+ln, nome_abrev: fn[0..2]+ln[0..2], endereco: 'Rua...', telefone1: '(85)9999-9999', telefone2: '(85)8888-8888')
		for i in 1..rand(3..6)
			r.produto_emprestados.new do |pe|
				pe.produto = products.sample
				pe.quantidade = rand(10..20)
				pe.save!
			end
		end
	end
end
sellers = Representante.all
puts "gerando #{sellers.size} representantes"

for i in 1..rand(30..50)
	Venda.new do |nv|
		nv.data_da_venda = rand(3.weeks).ago
		nv.cliente = clients.sample
		nv.usuario = users.sample
		if rand < 0.75
			nv.representante = sellers.sample
		else
			nv.resposavel_pela_venda = 'irresponsavel!!!'
		end
		nv.save!
		nv.errors.full_messages.each do |m| puts m end
		for i in 1..rand(2..5)
			nv.pagamentos.new do |p|
				p.tipo_de_pagamento = TipoDePagamento.all.sample
				p.valor = rand(500..1000)
				p.data_de_entrada = rand(1.week).from_now
				p.data_do_pagamento = rand(3.days).ago
				p.save!
			end
		end
		for i in 1..rand(4..10)
			nv.venda_items.new do |vi|
				vi.produto = products.sample
				vi.quantidade = rand(10..50)
				vi.valor_unit = rand(30.0..50.0).round(2)
				vi.save!
			end
		end
	end
end
puts "geradas #{Venda.all.size} vendas"

for i in 1..5
	gd = GrupoDeDespesa.new(descricao: 'grupo de despesa '+i.to_s, data_das_despesas: rand(3.weeks).ago)
	gd.usuario = users.sample
	gd.save!
	for j in 1..rand(3..7)
		d = Despesa.new(descricao: 'despesa '+i.to_s+j.to_s, valor: rand(500..1000))
		d.grupo_de_despesa = gd
		d.save!
	end
end
puts "gerados #{GrupoDeDespesa.all.size} grupos e #{Despesa.all.size} despesas"

tiposDeMovimentacao = ['quebra de produto', 'devolucao pelo revendendor', 'emprestimo pelo revendedor', 'venda direta']
for t in tiposDeMovimentacao
	TipoDeMovimentacao.create(descricao: t)
end
puts "gerados #{TipoDeMovimentacao.all.size} tiposDeMovimentacao"

tipos = TipoDeMovimentacao.all
for i in 1..rand(40..75)
	MovimentacaoDeEstoque.new(observacoes: 'movimentacao '+i.to_s, quantidade: rand(-1000..1000), dataDaMovimentacao: rand(3.weeks).ago) do |me|
		me.usuario = users.sample
		me.representante = sellers.sample
		me.produto = products.sample
		me.tipo_de_movimentacao = tipos.sample
		me.save!
	end
end
puts "gerados #{MovimentacaoDeEstoque.all.size} movimentacoes de estoque"
