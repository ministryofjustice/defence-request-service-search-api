class SolicitorsController < ApplicationController

  def index
    solicitors = Solicitor.limit(10).includes([:firm])
    render json: { solicitors: solicitors }, include: :firm
  end

  def show
    solicitor = Solicitor.find(params[:id])
    render json: { solicitor: solicitor }, include: :firm
  end

  def search
    search_term = params[:q]
    solicitors = Solicitor.search('name',search_term).limit(10)
    render json: { solicitors: solicitors }, include: :firm
  end
end