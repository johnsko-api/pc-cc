class Match < ActiveRecord::Base
  has_many :teams
  belongs_to :region
end
