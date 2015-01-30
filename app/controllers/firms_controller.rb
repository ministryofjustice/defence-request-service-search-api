class FirmsController < ApplicationController

  def index
    firms = Firm.limit(10).includes([:solicitors]).as_json(include: :solicitors)
    render json: firms
  end

  def show
    firms = Firm.find(params[:id]).as_json(include: :solicitors)
    render json: firms
  end

  def search
    search_term = params[:q]
    firms = Firm.search('name',search_term).limit(10).as_json(include: :solicitors)
    render json: firms
  end
end
