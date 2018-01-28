class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :summary]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_url, notice: 'Course was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
      if @course.update(course_params)
        redirect_to @course, notice: 'Course was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    if (!@course.students.empty? || !@course.evaluation_instances.empty?)
      redirect_to courses_url, alert: 'This course can not be eliminated. It has associated information'
    else
      @course.destroy
      redirect_to courses_url, notice: 'Course was successfully destroyed.'
    end
  end

  def summary
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:year)
    end
end
