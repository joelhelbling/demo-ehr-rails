class Prescription < ActiveRecord::Base
  belongs_to :patient
  has_many :requests

  FREQUENCIES = [
  	['qD - EVERY DAY', 'qD'],
  	['BID - TWICE A DAY', 'BID'],
  	['TID - THREE A DAY', 'TID'],
  	['QID - FOUR A DAY', 'QID'],
  	['PRN - AS NEEDED', 'PRN'],
  	['UD - AS DIRECTED', 'UD']
  ]

end
