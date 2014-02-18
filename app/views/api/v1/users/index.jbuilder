json.users @users do |user|
  json.partial! 'v1/users/model', user: user
end
