class Article < ActiveRecord::Base
  attr_accessible :body, :title

  before_create :set_author
  before_create :set_is_published
  validates_presence_of :body, :title
  belongs_to :user

  scope :unpublished, where(:is_published => false)

  private
  def set_author
    self.user_id ||= User.current
  end

  def set_is_published
    self.is_published = 0
  end

end
