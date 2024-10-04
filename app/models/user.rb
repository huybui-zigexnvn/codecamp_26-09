class User < ApplicationRecord
  has_many :reviews

  def self.find_or_create_by_cookie(uid_cookie)
    user = find_or_create_by(uid_cookie:)
    user
  end
end
