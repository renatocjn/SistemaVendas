class Despesa < ActiveRecord::Base
  belongs_to :grupo_de_despesa
  attr_accessible :descricao, :valor
end
