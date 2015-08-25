# Homepage (Root path)


get '/' do
  erb :index
end


get '/login' do
 reponse = HTTParty.get("https://accounts.spotify.com/authorize/?client_id=0422daa52d9c46f48d3ff2a0edfbc71a&response_type=code")

 puts response.body
end

get '/hello' do
  erb :hello
end