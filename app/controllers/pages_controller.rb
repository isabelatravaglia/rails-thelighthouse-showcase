class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :companies, :leaders ]

  def home
  end

  def about
  end

  def companies
  end

  def leaders
  end
end
