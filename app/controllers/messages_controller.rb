class MessagesController < ApplicationController
  include Secured
  def index
    

    secret = "JEdMKdLz%ZQ3w(bxRdk4K#NMrN/:p}6H9bF,Ej-F"
    sso = SingleSignOn.parse(request.query_string, secret)
    sso.email = 'suchwowalexau@gmail.com'#current_user.email # from devise
    sso.name = 'Alex Au'#current_user.full_name # this is a custom method on the User class
    sso.username = 'suchwowalexau' #current_user.email # from devise
    sso.external_id = 1 #current_user.id # from devise
    sso.sso_secret = secret

    raise
    redirect_to sso.to_url("http://discourse.local/session/sso_login")
  end
end
