class RequestsController < ApplicationController
    def new
        car = Car.find(params[:car_id])
        slot = car.slots.find(params[:slot_id])
        @request = slot.requests.create(request_params)
        redirect_to @car
    end


    private
        def request_params
            debugger
            params.require(:request).permit(:status)
        end
end