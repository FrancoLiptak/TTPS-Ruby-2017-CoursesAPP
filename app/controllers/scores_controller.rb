class ScoresController < ApplicationController
  before_action :set_evaluation_instances
  before_action :upload, only: [:index]

  # GET evaluation_instances/1/scores
  def index
  end

  # GET evaluation_instances/1/scores/1
  def show
  end

  # GET evaluation_instances/1/scores/new
  def new
  end

  # GET evaluation_instances/1/scores/1/edit
  def edit
  end

  # POST evaluation_instances/1/scores
  def create
    @score = @evaluation_instances.scores.build(score_params)

    if @score.save
      redirect_to([@score.evaluation_instance, @score], notice: 'Score was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT evaluation_instances/1/scores/1
  def update
    if @evaluation_instances.update_attributes(score_params)
      redirect_to course_evaluation_instance_scores_path(@evaluation_instances.course, @evaluation_instances), notice: 'Score was successfully updated.'
    else
      render action: 'index'
    end
  end

  # DELETE evaluation_instances/1/scores/1
  def destroy
    @score.destroy

    redirect_to evaluation_instance_scores_url(@evaluation_instances)
  end

  private

  def upload
    @evaluation_instances.course.students.each do |student|
      @evaluation_instances.scores.build(student: student)
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation_instances
      @evaluation_instances = EvaluationInstance.find(params[:evaluation_instance_id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:evaluation_instance).permit(scores_attributes: %i[score id student_id])
    end
end
