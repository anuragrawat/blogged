class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :role, :as => :admin
  validates_uniqueness_of :name

  before_create :default_role
  has_many :articles

  @@roles = [:admin, :editor, :reporter, :guest]
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me #, :as => [:default, :editor, :reporter, :admin]
  def self.get_all_roles
    @@roles
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end


  private
  def default_role
    self.role = 'reporter'
  end

end
