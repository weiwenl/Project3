class Programmer < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  belongs_to :user #One user has one programmer details
  has_many :posts #One user can write multiple posts
  has_many :comments #One user can give many comments
  enum programmer_level: [:rookie, :expert]
end
