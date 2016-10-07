get '/' do
  @abuelita = params[:abuelita]
  erb :index
  # Visita app/views/index.erb
end

post '/abuelita' do
  user_input = params[:user_input]
  abuelita = user_input == "BYE TQM" ? "HASTA LUEGO, ADIOS!" : user_input == user_input.upcase ? "NO, NO DESDE 1983" : "HUH?! NO TE ESCUCHO, HIJO!"
  redirect to ("/?abuelita=#{abuelita}") 
end

