class Api::V1::CarsController < Api::V1::ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :authenticate_request

  # GET /cars or /cars.json
  def index
    @cars = Car.all
    render json: @cars
  end

  # GET /cars/1 or /cars/1.json
  def show
    render json: @car
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit; end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)
    @car.user_id = @current_user.id

    if @car.save
      render json: { car: @car, message: 'Car added successfully!' }, status: :created
    else
      render json: { message: @car.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json

  def destroy
    @car = Car.find(params[:id])
    if @car.destroy
      render json: { message: 'Car successfully deleted' }, status: :ok
    else
      render json: { message: @car.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:make, :model, :year, :image, :description, :daily_rate)
  end
end
