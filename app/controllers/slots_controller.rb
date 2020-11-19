class SlotsController < ApplicationController
    def create
        @car = Car.find(params[:car_id])
        @slot = @car.slots.create(slot_params)
        redirect_to cars_path(@car)
    end


    private
        def slot_params
            params.require(:slot).permit(:from_date, :to_date, :amount)
        end
end
