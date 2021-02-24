class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :body, :nickname, :company, :phone, :privacy_policy, :course

  validates :name, presence: { message: "deve ser preenchido." }
  validates :body, presence: { message: "deve ser preenchida." }
  validates :nickname, absence: { message: "deve ficar vazio." }
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i,
  message: ->(object, data) do
    "Por favor, digite um #{data[:attribute]} válido."
  end
  }
  validates :privacy_policy, acceptance: { message: 'Por favor, aceite nossa Política de Privacidade para nos enviar uma mensagem.' }
  
end
