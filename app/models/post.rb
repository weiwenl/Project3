class Post < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  belongs_to :programmer
  has_many :comments, dependent: :delete_all
end
