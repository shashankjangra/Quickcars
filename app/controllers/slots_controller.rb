class SlotsController < ApplicationController

    def edit
        @car = Car.find(params[:car_id])
        @slot = @car.slots.params(slot_params)
    end

    def create
        @car = Car.find(params[:car_id])
        @slot = @car.slots.create(slot_params)
        redirect_to cars_path(@car)
    end
    
    def slotedit
        @car = Car.find(params[:car_id])
        @slot = @car.slot.update(slot_params)
        if @slot.update(slot_params)
            redirect_to @car
        else
            render 'edit'
        end
    end

    def destroy
        @car = Car.find(params[:car_id])
        @slot = @car.slots.find(params[:slot_id])
        @slot.destroy
        redirect_to @car
    end

    private
        def slot_params
            params.require(:slot).permit(:from_date, :to_date, :amount)
        end
end
