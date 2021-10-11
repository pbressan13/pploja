class Produto < ApplicationRecord

    belongs_to :departamento, optional: true

    validates :preco, :quantidade, :departamento, presence: true
    validates :nome, length: { minimum: 4}
    validates :descricao, length: { minimum: 5, maximum:200}

end
