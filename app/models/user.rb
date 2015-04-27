class User < ActiveRecord::Base
  @@code = ''
  has_secure_password
end
