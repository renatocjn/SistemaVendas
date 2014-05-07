class Produto < ActiveRecord::Base
	has_many :venda_itens
	has_many :vendas, :through => :venda_itens
	has_and_belongs_to_many :representantes
	has_many :movimentacao_de_estoques
	attr_accessible :descricao, :estoque

	def to_label
		descricao
	end
end
