class SessionsController < ApplicationController
    def create
        # Login the dev here
        auth = request.env['omniauth.auth']
        # Find an identity here
        @identity = Identity.find_with_omniauth(auth)

        if @identity.nil?
            # If no identity was found, create a brand new one here
            @identity = Identity.create_with_omniauth(auth)
        end

        if signed_in?
            if @identity.dev == current_dev
                # dev is signed in so they are trying to link an identity with their
                # account. But we found the identity and the dev associated with it 
                # is the current dev. So the identity is already associated with 
                # this dev. So let's display an error message.
                redirect_to root_url, notice: "Already linked that account!"
            else
                # The identity is not associated with the current_dev so lets 
                # associate the identity
                @identity.dev = current_dev
                @identity.save()
                redirect_to root_url, notice: "Successfully linked that account!"
            end
        else
            if @identity.dev.present?
                # The identity we found had a dev associated with it so let's 
                # just log them in here
                self.current_dev = @identity.dev
                redirect_to root_url, notice: "Signed in!"
            else
                # No dev associated with the identity so we need to create a new one
                redirect_to root_url, notice: "Please finish registering"
            end
        end
    end

    def destroy
        # Logout the dev here
        sign_out
        redirect_to root_url
    end
end
