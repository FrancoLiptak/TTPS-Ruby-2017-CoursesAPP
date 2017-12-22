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
  end

  # PUT evaluation_instances/1/scores/1
  def update
    @evaluation_instances.update_attributes(score_params)
    render action: 'index'
  end

  # DELETE evaluation_instances/1/scores/1
  def destroy
  end

  private

  def upload
    @evaluation_instances.course.students.each do |student|
      @evaluation_instances.scores.build(student: student)
    end
    render action: 'index'
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
