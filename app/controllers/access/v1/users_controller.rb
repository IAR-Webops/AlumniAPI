class Access::V1::UsersController < ApplicationController
    skip_before_filter :require_signin
    respond_to :json

    def show
        respond_with User.find(params[:id])
    end
end
