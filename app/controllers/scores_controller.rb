class ScoresController < ApplicationController
  before_action :set_scores
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET evaluation_instances/1/scores
  def index
    @scores = @evaluation_instances.scores
  end

  # GET evaluation_instances/1/scores/1
  def show
  end

  # GET evaluation_instances/1/scores/new
  def new
    @score = @evaluation_instances.scores.build
  end

  # GET evaluation_instances/1/scores/1/edit
  def edit
  end

  # POST evaluation_instances/1/scores
  def create
    @score = @evaluation_instances.scores.build(score_params)

    if @score.save
      redirect_to([@score.evaluation_instances, @score], notice: 'Score was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT evaluation_instances/1/scores/1
  def update
    if @score.update_attributes(score_params)
      redirect_to([@score.evaluation_instances, @score], notice: 'Score was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE evaluation_instances/1/scores/1
  def destroy
    @score.destroy

    redirect_to evaluation_instances_scores_url(@evaluation_instances)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scores
      @evaluation_instances = EvaluationInstance.find(params[:evaluation_instance_id])
    end

    def set_score
      @score = @evaluation_instances.scores.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:score).permit(:students_id, :score)
    end
end
