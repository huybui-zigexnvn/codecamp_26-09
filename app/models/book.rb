class Book < ApplicationRecord
  has_many :reviews
  def self.ransackable_attributes(auth_object = nil)
    ["author", "title"]
  end
end
