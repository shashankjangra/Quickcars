class CarsController < ApplicationController
    # skip_before_action :verify_authenticity_token
    # CODE_COMMENT: I see that most of the controller / view code you have written is in cars any reason for this? 
    # Probabaly you could have also used dashboard controller well?
    # CODE_COMMENT: Why is the above line there?
    before_action :authenticate_user!, except: [:index, :show, :allcars]
    before_action :correct_user, only: [:edit, :update, :destroy, :dashboard]

    # CODE_COMMENT: Are we sure we want all the cars for the next 3 statements? Isnt that an overkil? We should do some sort of user related car fetching 
    # or something on those lines correct?
    #Is there any imp attributes that a car should have mandatorily. What happens if there are 1000 cars or more ?.
    def allcars
        @cars = Car.all
    end

    def dashboard        
        @cars = Car.all
    end

    def index
        @cars = Car.all
    end

    def show
        @car = Car.find(params[:id])
        #Do you want to show all details of car? what happens if you have 8 columns and want to just show 1 column's value in views?
    end

  def new
    #   @car = Car.new
      @car = current_user.cars.build
  end

  def edit
      @car = Car.find(params[:id])
  end

  def create
    #use instance variable only when required => applies to other actions and controller too
    #   @car = Car.new(car_params)
    debugger
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
      #CODE_COMMENT: Sure we need this function to be implemented
      @car = Car.find(params[:id])
        #what happens if the car is not destroyed ? => also for slot's controller
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
