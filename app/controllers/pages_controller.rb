class PagesController < ApplicationController
  def home
  end

  def dashboard
    @paystubs = current_user.payrolls
  end
end
