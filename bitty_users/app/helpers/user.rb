helpers do
  # Esto deberá de regresar al usuario con una sesión actual si es que existe 
  def current_user
    session[:id] != nil ? User.find(session[:id]) : nil
  end

  # Regresa true si el current_user existe y false de otra manera 
  def logged_in?
    current_user != nil ? true : false
  end
  
end