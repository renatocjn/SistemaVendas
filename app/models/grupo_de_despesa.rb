class GrupoDeDespesa < ActiveRecord::Base
  belongs_to :usuario
  attr_accessible :data_das_despesas, :descricao

  validates_presence_of :usuario, :data_das_despesas, :descricao
end
