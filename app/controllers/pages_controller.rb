class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :companies, :leaders ]

  def home
    @services = Service.where(hp_show: true)
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
