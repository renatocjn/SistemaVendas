class MovimentacaoDeEstoque < ActiveRecord::Base
  belongs_to :tipo_de_movimentacao
  belongs_to :produto
  belongs_to :representante
  belongs_to :usuario
  attr_accessible :dataDaMovimentacao, :observacoes, :quantidade
end
