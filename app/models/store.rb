class Store < ApplicationRecord
    
    has_many(:assignments)
    validates_inclusion_of :state, :in => ["OH", "WV", "PA"]
    validates_uniqueness_of :name, :case_sensitive => true
    validates :zip, :presence => true
    validates :street, :presence => true
    validates :name, :presence => true
    
  #  validates_format_of :phone, :with => /^(1-)?\d{3}-\d{3}-\d{4}$/
    
    scope :active, -> { where('active = ?', true) }
    scope :inactive, -> { where('active = ?', false) }
    scope :alphabetical, -> { order('name asc') }
end
