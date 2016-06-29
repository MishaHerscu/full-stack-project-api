#
class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all

    render json: @goals
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    render json: @goal
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      render json: @goal, status: :created, location: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])

    if @goal.update(goal_params)
      head :no_content
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy

    head :no_content
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:player_id, :game_id)
  end
end
