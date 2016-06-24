#
class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]
  # skip_before_action :authenticate, only: [:index] # not needed?

  # GET /games
  # GET /games.json
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  # GET /games/1.json
  def show
    render json: @game
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    if @game
      @game[:date] = update_game[:date]
      @game[:opponent] = update_game[:opponent]
      @game[:won] = update_game[:won]
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy

    head :no_content
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def update_game
    params.require(:new_game_details).permit(:date, :opponent, :won)
  end

  def game_params
    params.require(:game).permit(:date, :opponent, :won)
  end

  private :set_game, :update_game, :game_params
end
