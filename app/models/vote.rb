class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates_presence_of :user, :book, :value
  validates_inclusion_of :value, in: [0, 1]
end
