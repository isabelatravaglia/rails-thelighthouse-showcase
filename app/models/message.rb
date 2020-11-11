class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :body

  validates :name, :body, :email, presence: true
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i,
  message: "Por favor, digite um email válido." }
end
