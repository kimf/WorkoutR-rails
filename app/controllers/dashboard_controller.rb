class DashboardController < ApplicationController

  def index
    today = Date.today
    @start = today.beginning_of_month - 9.months
    @stop = today.end_of_month + 6.months
  end
end
