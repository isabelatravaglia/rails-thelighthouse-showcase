class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @services = Service.all
  end
end
