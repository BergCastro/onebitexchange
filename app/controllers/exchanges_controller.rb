class ExchangesController < ApplicationController
  def index
  end

  def convert
    value, btcvalue = ExchangeService.new(params[:source_currency], params[:target_currency], params[:amount]).perform
    render json: {"value": value, "btcvalue": btcvalue}
  end
end
