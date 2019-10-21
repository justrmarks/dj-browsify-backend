class User < ApplicationRecord

  has_many :songs

  def self.get_by_username(username)
    User.all.find{|user| user.email.include?(username)}
  end
end
