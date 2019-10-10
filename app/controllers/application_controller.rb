require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end
  #
  # get '/login' do
  #   erb :"/sessions/login.html"
  # end
  #
  # post '/sessions' do
  #   raise params.inspect
  # end
  #
   helpers do
     def logged_in?
       !!current_user
     end

     def current_user
       @current_user ||= User.find_by(:email => session[:email]) if session[:email]
     end

     # def current_user_recipes
     #   @current_user_recipes ||= Recipe.find_by(:id => session[:id]) if session[:id]
     # end

     def login(email, password)
        user = User.find_by(:email => email)
        if user && user.authenticate(password)
           session[:email] = user.email
       else
         redirect '/login'
       end
     end
   end


     def log_out!
       session.clear
     end
  #
  #   def redirect_if_not_logged_in
  #     if !logged_in?
  #       redirect '/login'
  #     end
  #   end
   end
