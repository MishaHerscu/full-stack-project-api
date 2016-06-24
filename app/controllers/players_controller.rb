#
class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]
  # skip_before_action :authenticate, only: [:index, :show] # not needed?

  # GET /players
  # GET /players.json
  def index
    @players = Player.all

    render json: @players
  end

  # GET /players/1
  # GET /players/1.json
  def show
    render json: @player
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update_foreign_keys
    @player[:team_id] = update_player[:team_id]
    @player[:user_id] = update_player[:user_id]
  end

  def update_attributes
    @player[:surname] = update_player[:surname]
    @player[:given_name] = update_player[:given_name]
    @player[:email] = update_player[:email]
    @player[:phone_number] = update_player[:phone_number]
    @player[:captain] = update_player[:captain]
  end

  def update
    @player = Player.find(params[:id])
    if @player
      update_attributes
      update_foreign_keys
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy

    head :no_content
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def update_player
    params.require(:new_player_details).permit(:surname, :given_name, :email,
                                               :phone_number, :captain,
                                               :team_id, :user_id)
  end

  def player_params
    params.require(:player).permit(:surname, :given_name, :email, :phone_number,
                                   :captain, :team_id, :user_id)
  end

  private :set_player, :update_player, :player_params
end
