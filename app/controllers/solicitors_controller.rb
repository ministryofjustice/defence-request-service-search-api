class SolicitorsController < ApplicationController

  def index
    solicitors = Solicitor.limit(10).includes([:firm]).as_json(include: :firm)
    render json: solicitors
  end

  def show
    solicitor = Solicitor.find(params[:id]).as_json(include: :firm)
    render json: solicitor
  end

  def search
    search_term = params[:q]
    solicitors = Solicitor.search('name',search_term).limit(10).as_json(include: :firm)
    render json: solicitors
  end
end