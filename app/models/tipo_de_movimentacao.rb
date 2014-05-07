class TipoDeMovimentacao < ActiveRecord::Base
  attr_accessible :descricao

  validates_uniqueness_of :descricao

  def to_label
	  descricao
  end
end
