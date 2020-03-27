class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find(params[:id])
    end

    def new
        @review = Review.new
        @course = Course.find(params[:course_id])
    end

    def create
        current_golfer = Golfer.find(session[:golfer_id])
        @review = current_golfer.reviews.new(review_params)
        @course = Course.find(params[:course_id])
        @review.course = @course
        if @review.save
            redirect_to course_path(@course)
        else
            p @review.errors.full_messages
            render :new
        end
    end

    def edit
        @review = Review.find(params[:id])
        @course = Course.find(params[:course_id])
        @golfer = Golfer.find(session[:golfer_id])
    end

    def update
        p params
        current_golfer = Golfer.find(session[:golfer_id])
        @review = current_golfer.reviews.find(params[:course_id])
        @review.assign_attributes(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    private

    def review_params
        params.require(:review).permit(:rating, :title, :content, :golfer_id, :round_id, :course_id)
    end

end