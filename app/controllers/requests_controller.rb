class RequestsController < ApplicationController

    def status
        req = Request.find(params[:request_id])
    end

    def new
        @car = Car.find(params[:car_id])
        @slot = Slot.find(params[:slot_id])
        r = Request.new
        debugger
        r.user = current_user.email
        r.status = 1
        r.slot_id = @slot.id
        r.save
        redirect_to @car
    end

    def update
        r = Request.find(params[:id])
        r.status = "booked"
        r.save
        redirect_to cars_path
    end

    def destroy
        r = Request.find(params[:id])
        r.destroy
        redirect_to cars_path
    end
    

    private
        def request_params
            params.require(:request).permit(:status , :slot_id)
        end
end