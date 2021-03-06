class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :time_zone
  has_many :connections, dependent: :destroy
  has_many :posts, dependent: :destroy

  def twitter
    self.connections.where(provider: 'twitter').first
  end

  def facebook
    self.connections.where(provider: 'facebook').first
  end

  def linkedin
    self.connections.where(provider: 'linkedin').first
  end
end
