class RepresentantesVendas < ActiveRecord::Base
  belongs_to :representante
  belongs_to :venda

  validates_presence_of :representante, :venda
end
