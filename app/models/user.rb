class User < ActiveRecord::Base
  self.inheritance_column = :type_disabled

  has_many :ratings
  has_many :movies
end
