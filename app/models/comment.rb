class Comment < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  belongs_to :post
  # belongs_to :programmer
end
