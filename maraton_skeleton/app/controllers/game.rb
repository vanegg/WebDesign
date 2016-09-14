post '/play/:name' do
  p params
  erb :play
end

post '/statistics' do
  p params
  erb :statistics
end