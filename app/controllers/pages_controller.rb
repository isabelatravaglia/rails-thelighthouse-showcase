class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :companies, :leaders ]

  def home
    @services = Service.all
  end

  def about
  end

  def companies
    @services = Service.joins(:audiences).where(audiences: {audience_type: "empresa"})
  end

  def leaders
    @services = Service.joins(:audiences).where(audiences: {audience_type: "pessoa"})
  end
end
