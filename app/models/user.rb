class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :cart
  has_many :orders

  devise :database_authenticatable, :registerable,:lockable,
         :recoverable, :rememberable, :validatable,:confirmable

  def current_user?(user)
		user && user == self
	end
  protected
  def confirmation_required?
    false
  end
     
end
