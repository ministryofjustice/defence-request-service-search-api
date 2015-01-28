class SearchController < ApplicationController
  def search
    search_term = params[:q]
    solicitors = Solicitor.includes( [:firm] ).search('name',search_term).as_json(methods: :firm)
    firms = Firm.includes( [:solicitors] ).search('name',search_term).as_json(methods: :solicitors)

    results = { solicitors: solicitors, firms: firms }

    render json: results
  end
end
