class AuthenticationController < ApplicationController

    skip_before_action : auth_header, only: [:login]
    
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
