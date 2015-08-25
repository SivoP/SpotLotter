# Homepage (Root path)


get '/' do
  erb :index
end


get '/login' do
 HTTParty.get("https://accounts.spotify.com/authorize/?client_id=62ccc5854bf848bc94e84215ee0558d2&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A9393%2Fhello&scope=user-read-private%20user-read-email").to_s

end

get '/hello' do
  erb :hello
end