# Homepage (Root path)


get '/' do
  erb :index
end

get '/login' do
  authUrl = "https://accounts.spotify.com/authorize/?client_id=#{ENV["CLIENT_ID"]}&response_type=code&redirect_uri=http%3A%2F%2Flocalhost%3A9393%2Fhello&scope=user-read-private%20user-read-email"
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
  erb :hello
end




