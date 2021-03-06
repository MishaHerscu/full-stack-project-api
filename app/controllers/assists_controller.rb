#
class AssistsController < ProtectedController
  before_action :set_assist, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:update, :create, :destroy]

  # GET /assists
  # GET /assists.json
  def index
    @assists = Assist.all

    render json: @assists
  end

  # GET /assists/1
  # GET /assists/1.json
  def show
    render json: @assist
  end

  # POST /assists
  # POST /assists.json
  def create
    if current_user.admin == 'true'
      @assist = Assist.new(assist_params)

      if @assist.save
        render json: @assist, status: :created, location: @assist
      else
        render json: @assist.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /assists/1
  # PATCH/PUT /assists/1.json
  def update
    if current_user.admin == 'true'
      @assist = Assist.find(params[:id])

      if @assist.update(assist_params)
        head :no_content
      else
        render json: @assist.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /assists/1
  # DELETE /assists/1.json
  def destroy
    return unless current_user.admin == 'true'
    @assist.destroy

    head :no_content
  end

  private

  def set_assist
    @assist = Assist.find(params[:id])
  end

  def assist_params
    params.require(:assist).permit(:player_id, :game_id)
  end
end
