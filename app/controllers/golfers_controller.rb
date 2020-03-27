class GolfersController < ApplicationController

    def index
        @golfers = Golfer.all
    end

    def show
        @golfer = Golfer.find(params[:id])
    end

    def new
        @golfer = Golfer.new
    end

    def create
        p params
        @golfer = Golfer.new(golfer_params)
        if @golfer.save
            session[:golfer_id] = @golfer.id
            redirect_to golfer_path(@golfer)
        else
            render :new
        end
    end

    def edit
        @golfer = Golfer.find(params[:id])
    end

    def update
        @golfer = Golfer.find(params[:id])
        @golfer.assign_attributes(golfer_params)
        @golfer.username = @golfer.email.match(/^[a-z0-9]+/)[0]
        if @golfer.save
            redirect_to golfer_path(@golfer)
        else
            render :edit
        end
    end

    private

    def golfer_params
        params.require(:golfer).permit(:name, :email, :username, :password, :password_confirmation)
    end

end