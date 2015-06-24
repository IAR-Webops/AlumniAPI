class SessionsController < ApplicationController

    def create
        auth = request.env['omniauth.auth']
        @identity = Identity.find_with_omniauth(auth)
        @dev = Dev.find_by("email=?",auth['info']['email'])

        if @identity.nil?
            # If no identity was found, create a brand new one here
            if @dev.nil?
                dev = Dev.new
                auth['info']['name'] ? dev.name=auth['info']['name'] : dev.name="dev_bro"
                dev.email = auth['info']['email']
                dev.access_level = 4
                if dev.save
                    identity = Identity.new
                    identity.uid = auth['uid']
                    identity.provider = auth['provider']
                    identity.dev_id = dev.id
                    identity.save

                    sign_in dev
                    redirect_to root_url
                else
                    flash[:error] = "Sorry, there was some error in the information we received. Please try again later."
                    redirect_to root_url
                end
            else
                # Do something if the dev already exists but has logged in through new identity
                identity = Identity.new
                identity.uid = auth['uid']
                identity.provider = auth['provider']
                identity.dev_id = @dev.id
                identity.save

                sign_in @dev
                redirect_to root_url
            end
            @identity = Identity.create_with_omniauth(auth)
        else
            dev = Dev.find(@identity.dev_id)
            sign_in(dev)
            redirect_to root_url
        end
    end

    def destroy
        # Logout the dev here
        sign_out
        redirect_to root_url
    end
end
