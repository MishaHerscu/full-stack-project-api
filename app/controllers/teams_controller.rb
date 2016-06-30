#
class TeamsController < ProtectedController
  before_action :set_team, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:update, :create, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    render json: @teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    render json: @team
  end

  # POST /teams
  # POST /teams.json
  def create
    if current_user.admin == 'true'
      @team = Team.new(team_params)

      if @team.save
        render json: @team, status: :created, location: @team
      else
        render json: @team.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    if current_user.admin == 'true'
      @team = Team.find(params[:id])

      # @current_player = current_user.players.find
      # @current_team = @current_player.teams.find

      if @team.update(team_params)
        head :no_content
      else
        render json: @team.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    return unless current_user.admin == 'true'
    @team.destroy

    head :no_content
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end

  private :set_team, :team_params
end
