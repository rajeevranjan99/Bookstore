class UsersController < ApplicationController
  #before_action :authorize_request, except: [:new, :create]
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    
    #render json: @users, status: :ok
    respond_to do |format|
      format.html { render :index } # Render the HTML template for the index page
      format.json { render json: @users, status: :ok } # Render JSON for API requests
    end
    
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  def new 
    @user = User.new
  end
  # POST /users
  def create
   
    @user = User.new(user_params)
    if @user.save
      #render json: @user, status: :created
      redirect_to '/auth/login', notice: 'User was successfully created. Please log in.'
    else
      # render json: { errors: @user.errors.full_messages },
      #        status: :unprocessable_entity
      render :new
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    if @user.destroy
      render json: { message: "User successfully deleted" }, status: :ok
    else
      render json: { errors: "Failed to delete user" }, status: :unprocessable_entity
    end
    
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)

  end
end
