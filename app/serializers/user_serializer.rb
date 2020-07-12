require "jwt"
class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :email
  attributes :token do |user|
    p user
    JWT.encode({user_id: user.id}, "ATTENTION", 'HS256')
  end
end
