class AuthenticationController < ApplicationController

    def login
        @guest = Guest.find_by(username: params[:username])
    
        if !@guest
            render json:{ message: " That Guest does not Exist!"}
        else

            if !@guest.authenticate params[:password]
                render json: {message: 'password does not match'}
            else
                payload = {guest_id: @guest.id}
                secret = 'seceret password'
                token = JWT.encode(payload, secret)
                render json: {token: token}, status: :ok
            end
        end
    end

end
