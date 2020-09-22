class AudienceServicesController < ApplicationController
  def index
    @audience_services = AudienceService.all
  end
end
