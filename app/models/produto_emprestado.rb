class ProdutoEmprestado < ActiveRecord::Base
  belongs_to :representante
  belongs_to :produto
  attr_accessible :quantidade
end
