#
class GamesController < ProtectedController
  before_action :set_game, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:update, :create, :destroy]

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
    if current_user.admin == 'true'
      @game = Game.new(game_params)

      if @game.save
        render json: @game, status: :created, location: @game
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    if current_user.admin == 'true'
      @game = Game.find(params[:id])

      if @game.update(update_game)
        head :no_content
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    return unless current_user.admin == 'true'
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
    params.require(:game).permit(:date, :opponent, :won, :team_id)
  end

  private :set_game, :update_game, :game_params
end
