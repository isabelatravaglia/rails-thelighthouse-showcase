class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  invisible_captcha only: [:create], honeypot: :nickname

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.valid?
        ContactMailer.contact(@message).deliver_now
        format.js { render 'create.js.erb' }
      else
        format.js { render 'error.js.erb' }
      end
    end
  end

  private

	def message_params
    params.require(:message).permit(:name, :email, :body, :nickname, :company, :phone, :privacy_policy)
	end

end
