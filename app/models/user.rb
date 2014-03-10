class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  before_create :make_admin

  private

  def make_admin
    self.admin = true if User.all.count == 0
  end
end
