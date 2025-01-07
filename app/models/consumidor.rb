class Consumidor < ApplicationRecord
  belongs_to :usuario
  
  has_many :lancamentos
end
