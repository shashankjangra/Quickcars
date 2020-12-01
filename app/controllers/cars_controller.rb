class CarsController < ApplicationController
    # skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, except: [:index, :show, :allcars]
    before_action :correct_user, only: [:edit, :update, :destroy, :dashboard]

    def allcars
        @cars = Car.all
    end

    def dashboard
        @cars = Car.all
        @carrequests = Request.all
    end

    def index
        @cars = Car.all
    end

    def show
        @car = Car.find(params[:id])
    end

  def new
    #   @car = Car.new
      @car = current_user.cars.build
  end

  def edit
      @car = Car.find(params[:id])
  end

  def create
    #   @car = Car.new(car_params)
    @car = current_user.cars.build(car_params)
      if @car.save
          redirect_to @car     
      else
          render 'new'
      end
  end

  def update
      @car = Car.find(params[:id])
      if @car.update(car_params)
          redirect_to @car
      else
          render 'edit'
      end
  end

  def destroy
      # debugger
      @car = Car.find(params[:id])
      @car.destroy
      redirect_to cars_path
  end

  def correct_user
        @car = current_user.cars.find_by(id: params[:id])
        redirect_to cars_path, notice: "Not authorized to Edit this Car" if @car.nil?
  end


  private
  def car_params
      params.require(:car).permit(:cartype, :make, :model, :year, :serviced, :seats, :instructions, :user_id)
  end

  
end
