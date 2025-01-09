class Categorium < ApplicationRecord
    has_many :lancamentos
    has_many :receita
end
