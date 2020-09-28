class ApplicationController < ActionController::API

    before_action :authentcate
    
    def authenticate
        auth_header = request.headers['Authorization']

        if !auth_header
            render json: {message: 'No Token'} 
        else
            token = auth_header.split(' ')[1]
            secret = 'seceret password'
            begin
                decoded_token = JWT.decode token, secret
                payload = decoded_token.first
                guest_id = payload['guest_id']
                @guest = Guest.find(guest_id)
                render json:{ message: 'Invalid JWT'}
            rescue
            render json: {message: 'cool token'}
        end
    end

end
