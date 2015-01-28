class Firm < ActiveRecord::Base
  has_many :solicitors

  scope :search, -> (search_type, search_term) { where("#{search_type} ILIKE ?", "%#{search_term}%") }
end
