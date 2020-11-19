class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :body, :nickname

  validates :name, :body, :email, presence: { message: "É necessário preencher o nome" }
  validates :nickname, absence: { message: "Esse campo deve ficar vazio" }
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i,
  message: "Por favor, digite um email válido." }
end
