class Solicitor < ActiveRecord::Base
  belongs_to :firm

  scope :search, -> (search_type, search_term) { where("#{search_type} ILIKE ?", "%#{search_term}%") }

end
