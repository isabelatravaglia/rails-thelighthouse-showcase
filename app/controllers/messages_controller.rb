class MessagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [ :new, :create ]

	def new
    @message = Message.new
  end

	def create
		@message = Message.new(message_params)
		if @message.valid?
				MessageMailer.contact(@message).deliver_now
				redirect_to new_message_url
				flash[:notice] = "Recebemos sua mensagem! Entraremos em conto brevemente!"
		else
				flash[:notice] = "Ops! Não conseguimos receber sua mensagem. Por favor tente novamente"
				render :new
		end
	end

	private

	def message_params
    params.require(:message).permit(:name, :email, :body)
	end

end
