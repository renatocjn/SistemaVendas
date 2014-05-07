class Cliente < ActiveRecord::Base
	has_many :vendas
	has_many :pagamentos, :through => :vendas
	has_many :representantes, :through => :vendas
	has_many :produtos, :through => :vendas
	attr_accessible :endereco, :nome, :nome_abrev, :telefone1, :telefone2

	validates_presence_of :endereco, :nome, :nome_abrev, :telefone1, :telefone2

	validates_format_of :telefone1, :telefone2, with: /\((10)|([1-9][1-9])\)[0-9]{4,5}-?[0-9]{4}/, message: "Utilize o formato '(99)9999-9999', com ou sem hifen, para numeros de telefone"

	def to_label
		nome
	end
end
