class SolicitorsController < ApplicationController

  def index
    solicitors = Solicitor.includes([:firm]).as_json(methods: :firm)
    render json: solicitors
  end

  def show
    solicitor = Solicitor.find(params[:id]).as_json(methods: :firm)
    render json: solicitor
  end

  def search
    search_term = params[:q]
    solicitors = Solicitor.search('name',search_term).as_json(methods: :firm)
    render json: solicitors
  end
end