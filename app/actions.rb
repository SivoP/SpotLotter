# Homepage (Root path)


get '/' do
  erb :index
end

get '/login' do
  authUrl = "https://accounts.spotify.com/authorize/?client_id=62ccc5854bf848bc94e84215ee0558d2&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A9393%2Fhello&scope=user-read-private%20user-read-email"
  redirect authUrl 
end

get '/hello' do
  binding.pry
 
  # HTTParty.post("https://accounts.spotify.com/api/token/?grant_type=authorization_code&#code=#{params[:code]}&redirect_uri=http%3A%2F%2Flocalhost%3A9393%2Fhello",{
  #   header: 
  #   })
  erb :index

end




