#
class UsersController < ProtectedController
  before_action :set_user, only: [:show, :signout, :destroy]
  skip_before_action :authenticate, only: [:signup, :signin]

  # POST '/sign-up'
  def signup
    user_credentials = user_creds
    user_credentials[:admin] = 'false'
    user = User.create(user_credentials)
    if user.valid?
      render json: user, status: :created
    else
      head :bad_request
    end
  end

  # POST '/sign-in'
  def signin
    creds = user_creds
    if (user = User.authenticate creds[:email],
                                 creds[:password])
      render json: user, serializer: UserLoginSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # DELETE '/sign-out/1'
  def signout
    if current_user == @user
      current_user.logout
      head :no_content
    else
      head :unauthorized
    end
  end

  # PATCH '/change-password/:id'
  def changepw
    if !current_user.authenticate(pw_creds[:old]) ||
       (current_user.password = pw_creds[:new]).blank? ||
       !current_user.save
      head :bad_request
    else
      head :no_content
    end
  end

  def index
    render json: User.all
  end

  def show
    # user = User.find(params[:id])
    render json: @user
  end

  def update
    head :bad_request
  end

  # DELETE /user/1
  # DELETE /user/1.json
  def destroy
    # user = User.find(params[:id])
    @user.destroy

    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_creds
    params.require(:credentials)
          .permit(:email, :password, :password_confirmation)
  end

  def pw_creds
    params.require(:passwords)
          .permit(:old, :new)
  end

  private :user_creds, :pw_creds
end
