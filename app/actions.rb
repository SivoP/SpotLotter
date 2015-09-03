# Homepage (Root path)


get '/' do
  erb :index
end

get '/login' do
  authUrl = "https://accounts.spotify.com/authorize/?client_id=#{ENV["CLIENT_ID"]}&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A9393%2Fhello&scope=user-read-private%20user-read-email%20user-library-read"
  redirect authUrl 
end

get '/hello' do
  client_id = ENV["CLIENT_ID"]
  client_secret = ENV["CLIENT_SECRET"]
  client_id_and_secret = Base64.strict_encode64("#{client_id}:#{client_secret}")
  response = HTTParty.post("https://accounts.spotify.com/api/token",
  :body => {
    :grant_type => "authorization_code",
    :code => params[:code],
    :redirect_uri => "http://localhost:9393/hello"
  },
  :headers => {
    "Authorization" => "Basic #{client_id_and_secret}"
  }).to_hash

  access_token = response["access_token"]
  get_user = HTTParty.get("https://api.spotify.com/v1/me",
    :headers => {
      "Authorization" => "Bearer #{access_token}"
      }).to_hash
  
  @saved_tracks = HTTParty.get("https://api.spotify.com/v1/me/tracks", 
    :headers => {
      "Authorization" => "Bearer #{access_token}"
      })
  
   # @saved_tracks["items"][0]["track"]["name"])
   # @saved_tracks["items"][0]["track"]["artists"][0]["name"]
  erb :hello
  # end
end




