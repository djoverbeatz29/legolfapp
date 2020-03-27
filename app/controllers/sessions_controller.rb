class SessionsController < ApplicationController

    def new
    end

    def create
        p params
        golfer = Golfer.find_by(email: params[:email])
        if golfer && golfer.authenticate(params[:password])
            session[:golfer_id] = golfer.id
            redirect_to golfer
        else
            flash[:error] = "Invalid credentials. Try again!"
            redirect_to login_path
        end
    end
    
    def destroy
        session[:golfer_id] = nil
        redirect_to login_path
    end

end