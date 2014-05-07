class Venda < ActiveRecord::Base
	belongs_to :cliente
	belongs_to :usuario
	has_many :produtos, :through => :venda_items
	has_many :venda_items
	has_many :pagamentos
	belongs_to :representante
	attr_accessible :data_da_venda, :resposavel_pela_venda

	validates_presence_of :data_da_venda, :cliente, :usuario

	def valor_invalido?(x)
		return (x.nil? or x.blank?)
	end

	def venda_por_representante_ou_responsavel
		unless valor_invalido?(representante) ^ valor_invalido?(resposavel_pela_venda) #this is a XOR operation
			record.errors.add(:base, "Apenas o representante ou o resposavel_pela_venda pode estar setado, nunca os 2")
		end
	end

	validate :venda_por_representante_ou_responsavel

	accepts_nested_attributes_for :venda_items

end
