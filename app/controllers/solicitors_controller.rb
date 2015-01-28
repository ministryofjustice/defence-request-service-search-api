class SolicitorsController < ApplicationController

  def index
    solicitors = Solicitor.all
    render json: solicitors
  end

  def show
    solicitor = Solicitor.find(params[:id])
    render json: solicitor
  end

  def search
    search_term = params[:q]
    solicitors = Solicitor.search('name',search_term)
    render json: solicitors
  end
end