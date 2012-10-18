class MainController < ApplicationController

  def home
    redirect_to tickets_url if manager_signed_in?
  end

end
