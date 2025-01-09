class Receitum < ApplicationRecord
  belongs_to :consumidor, foreign_key: 'consumidors_id'
  belongs_to :categorium, foreign_key: 'categoria_id'

  validates :valor, presence: true, numericality: { greater_than: 0 }
  validates :data, presence: true
  validates :valor_cents, presence: true

  monetize :valor_cents, with_model_currency: :valor_currency
end
