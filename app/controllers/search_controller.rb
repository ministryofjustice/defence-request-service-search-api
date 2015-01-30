class SearchController < ApplicationController
  def search
    search_term = params[:q]
    solicitors = Solicitor.includes( [:firm] ).search('name',search_term).limit(10).as_json(include: :firm)
    firms = Firm.includes( [:solicitors] ).search('name',search_term).limit(10).as_json(include: :solicitors)

    results = { solicitors: solicitors, firms: firms }

    render json: results
  end
end
