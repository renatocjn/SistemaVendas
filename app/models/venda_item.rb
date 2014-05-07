class VendaItem < ActiveRecord::Base
  belongs_to :produto
  belongs_to :venda
  attr_accessible :quantidade, :valor_unit

  validates_presence_of :produto, :venda, :quantidade, :valor_unit
  validates_numericality_of :quantidade, :greater_or_equal_to => 1
  validates_numericality_of :valor_unit, :greater_than => 0
end
