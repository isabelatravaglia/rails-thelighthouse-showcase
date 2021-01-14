class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :body, :nickname, :company, :phone, :privacy_policy

  validates :name, :body, :email, presence: { message: "É necessário preencher o nome" }
  validates :nickname, absence: { message: "Esse campo deve ficar vazio" }
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i,
  message: "Por favor, digite um email válido." }
  validates :privacy_policy, acceptance: { message: 'Por favor, aceite nossa Política de Privacidade para nos enviar uma mensagem.' }
end
