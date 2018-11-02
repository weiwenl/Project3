class Post < ActiveRecord::Base
  acts_as_votable
  # AR classes are singular and capitalized by convention
  belongs_to :programmer
  has_many :comments, dependent: :delete_all
end
