class AuthenticationController < ApplicationController
  before_action :authorize_request, except: [:login, :new]

   # GET /auth/login
  def new
    # Instantiate a new user object for the login form
    @user = User.new
  end

  # POST /auth/login
  def login
 
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      redirect_to books_path, notice: 'Login successful'
      # render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
      #                username: @user.username ,message: 'Login successful'
      #                }, status: :ok
    else
      flash.now[:alert] = 'Invalid email or password' # Set a flash message
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
