class TipoDePagamento < ActiveRecord::Base
  attr_accessible :descricao

  validates_uniqueness_of :descricao
end
