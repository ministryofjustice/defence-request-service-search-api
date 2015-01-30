class Solicitor < ActiveRecord::Base
  belongs_to :firm

  scope :search, -> (search_type, search_term) { 
    if search_term.blank?
      all
    else
      where("#{search_type} ILIKE ?", "%#{search_term}%") 
    end
  }

end
