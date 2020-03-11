  class SessionsController < ApplicationController

    def new
      redirect_to root_path if current_user
    end
  
    def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/login'
      end
  
    end
  
    def destroy
      
      session[:user_id] = nil
      redirect_to '/login'
   
    end
  
    def create
      if user = User.authenticate_with_credentials(params[:email], params[:password])
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/login'
      end
    end
  
end