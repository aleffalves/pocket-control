class Consumidor < ApplicationRecord
  belongs_to :usuario

  has_many :lancamentos
  has_many :receita
end
