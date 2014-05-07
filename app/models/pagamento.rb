class Pagamento < ActiveRecord::Base
  belongs_to :tipo_de_pagamento
  belongs_to :venda
  has_one :cliente, :through => :venda
  attr_accessible :data_de_entrada, :data_do_pagamento, :valor
end
