class FirmsController < ApplicationController

  def index
    firms = Firm.includes(:solicitors).limit(10)
    render json: { firms: firms }, include: :solicitors
  end

  def show
    firm = Firm.find(params[:id])
    render json: { firm: firm }, include: :solicitors
  end

  def search
    search_term = params[:q]
    firms = Firm.search('name',search_term).limit(10)
    render json: { firms: firms }, include: :solicitors
  end
end
