class Prescription < ActiveRecord::Base
  belongs_to :patient
  has_many :pa_requests

  validates :drug_number, :format=> {:with => /[0-9]+/ , :message => 'Drug Number is invalid'}
  scope :active, -> { where(active: true) }
  
  FREQUENCIES = [
  	['qD - EVERY DAY', 'qD'],
  	['BID - TWICE A DAY', 'BID'],
  	['TID - THREE A DAY', 'TID'],
  	['QID - FOUR A DAY', 'QID'],
  	['PRN - AS NEEDED', 'PRN'],
  	['UD - AS DIRECTED', 'UD']
  ]

end
