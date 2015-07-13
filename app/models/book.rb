class Book < ActiveRecord::Base

  belongs_to :user, :class_name => "User", :foreign_key => "suggester_id"

  has_many :votes
  has_many :users, through: :votes

  validates_presence_of :title, :author
  validates_uniqueness_of :title, scope: :author

  # def self.by_sort_letter
  #   all.group_by { |s| s.sort_title_letter }
  # end

  def total_votes
    Vote.where(book_id: self.id).sum(:value)
  end

  def sort_title_letter
    title.chars.first.upcase
  end

  def self.save_as_selection title, author, customer_reviews
      self.where(
      title: title,
      author: author,
      customer_reviews: customer_reviews
      ).first_or_create!
  end

end
