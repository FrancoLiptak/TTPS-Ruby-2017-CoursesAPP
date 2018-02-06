class ScoresController < ApplicationController
  before_action :set_evaluation_instances, only: [:index, :update]
  before_action :upload, only: [:index]

  # GET evaluation_instances/1/scores
  def index
    @scores = @evaluation_instances.scores
  end

  # PUT evaluation_instances/1/scores/1
  def update
    @evaluation_instances.assign_attributes(score_params)
    if @evaluation_instances.save
      delete_null_scores
      upload
      render action: 'index', notice: 'Score was successfully updated.'
    else 
      upload
      render action: 'index', alert: 'An error has occurred.'
    end
  end

  private

  def upload
    @evaluation_instances.course.students.each do |student|
      @evaluation_instances.scores.build(student: student) unless !(Score.has_score_for(self, @evaluation_instances).empty?)
    end
  end

    def set_evaluation_instances
      @evaluation_instances = EvaluationInstance.find(params[:evaluation_instance_id])
    end

    def score_params
      scores = params.require(:evaluation_instance).permit(scores_attributes: %i[score id student_id evaluation_instance_id])
    end

    def delete_null_scores
      score_params.fetch(:scores_attributes).each do | key, value | 
        Score.find(value['id']).destroy if value['id'] && value['score'].empty?
      end
    end
end
