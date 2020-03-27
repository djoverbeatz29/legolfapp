class CoursesController < ApplicationController

    def index
        @courses = Course.all
        @golfer = Golfer.find(session[:golfer_id])
    end

    def show
        @course = Course.find(params[:id])
    end

    def new
        @course = Course.new
    end

    def create
        @course = Course.new(course_params)
        if @course.save
            redirect_to course_path(@course)
        else
            render :new
        end
    end

    def edit
        @course = Course.find(params[:id])
    end

    def update
        @course = Course.find(params[:id])
        @course.assign_attributes(course_params)
        if @course.save
            redirect_to course_path(@course)
        else
            render :edit
        end
    end

    def destroy
        Course.find(params[:id]).destroy
        redirect_to courses_url
    end

    private

    def course_params
        params.require(:course).permit(:name, :par, :description, :pic)
    end

end