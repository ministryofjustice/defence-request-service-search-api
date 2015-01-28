class FirmsController < ApplicationController


  def index
    firms = Firm.all
    render json: firms
  end

  def show
    firms = Firm.find(params[:id])
    render json: firms
  end

  def search
    search_term = params[:q]
    firms = Firm.search('name',search_term)
    render json: firms
  end
end