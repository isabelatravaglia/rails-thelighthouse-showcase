class AudienceServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @audience_services = AudienceService.all
  end
end
