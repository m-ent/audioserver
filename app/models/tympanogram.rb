class Tympanogram < ActiveRecord::Base
  belongs_to :patient
  belongs_to :examiner

  validates_presence_of :examdate, :impedancemeter, :on => :create
end
