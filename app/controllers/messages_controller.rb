class MessagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
		@message = Message.new
	end

  def create
    @message = Message.new(message_params)
    if @message.valid?
			ContactMailer.contact(@message).deliver_now
			redirect_to root_path
			flash[:notice] = "Recebemos sua mensagem! Entraremos em contato brevemente!"
		else
			flash[:notice] = "Ops! Não conseguimos receber sua mensagem. Por favor preencha todos os campos e tente novamente."
      # render "/messages/_new", locals: {message: @message}
      redirect_to root_path
		end
	end

	private

	def message_params
    params.require(:message).permit(:name, :email, :body, :nickname)
	end

end
