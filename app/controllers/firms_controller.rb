class FirmsController < ApplicationController


  def index
    firms = Firm.includes([:solicitors]).as_json(methods: :solicitors)
    render json: firms
  end

  def show
    firms = Firm.find(params[:id]).as_json(methods: :solicitors)
    render json: firms
  end

  def search
    search_term = params[:q]
    firms = Firm.search('name',search_term).as_json(methods: :solicitors)
    render json: firms
  end
end
