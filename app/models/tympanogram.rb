class Tympanogram < ActiveRecord::Base
  belongs_to :patient
  belongs_to :examiner
end
