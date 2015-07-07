class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :votes
  has_many :books

  before_create do
    self.votes_left = 1
  end

  def num_of_books_suggested_this_month
    suggested_books.where('created_at >= ?', 1.month.ago).count
  end
end
