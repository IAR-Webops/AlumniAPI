class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    include SessionsHelper
    protect_from_forgery with: :null_session

    before_filter :require_signin

    private

        def require_signin
            unless current_dev
                redirect_to root_path
            end
        end

end
