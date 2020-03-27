class RoundsController < ApplicationController

    def index
        @rounds = Round.all
    end

    def show
        @round = Round.find(params[:id])
    end

    def new
        @round = Round.new
        @golfer = Golfer.find(session[:golfer_id])
    end

    def create
        current_golfer = Golfer.find(session[:golfer_id])
        @round = current_golfer.rounds.new(round_params)
        @round.date_time_handler(params[:round][:tee_time])
        if @round.save
            puts "Thank you! Your tee time has been saved."
            redirect_to golfer_path(current_golfer)
        else
            p @round.errors.full_messages
            render :new
        end
    end

    def edit
        @round = Round.find(params[:id])
        @golfer = Golfer.find(session[:golfer_id])
    end

    def update
        current_golfer = Golfer.find(session[:golfer_id])
        @round = current_golfer.rounds.find(params[:id])
        @round.date_time_handler(params[:round][:tee_time])
        @round.assign_attributes(round_params)
        if @round.save
            puts "Your changes have been saved."
            redirect_to golfer_path(current_golfer)
        else
            render :edit
        end
    end

    def destroy
        @golfer = Golfer.find(session[:golfer_id])
        @round = @golfer.rounds.find(params[:id])
        @round.destroy
        redirect_to golfer_path(@golfer)
    end

    private

    def round_params
        params.require(:round).permit(:score, :golfer_id, :course_id)
    end

end