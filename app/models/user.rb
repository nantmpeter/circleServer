class User < ActiveRecord::Base
  validates_uniqueness_of :name
  @@code = ''
  has_secure_password
end
