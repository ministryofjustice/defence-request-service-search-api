class SearchController < ApplicationController
  def search
    search_term = params[:q]
    solicitors = Solicitor.search('name',search_term)
    firms = Firm.includes( [:solicitors] ).search('name',search_term).as_json(methods: :solicitors)

    results = { solicitors: solicitors, firms: firms }

    render json: results
  end
end
