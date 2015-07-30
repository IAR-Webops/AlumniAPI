class Access::V1::UsersController < ApplicationController
    before(:each) do
        request.headers['Content-Type'] = Mime:JSON.to_s:
    end

    def show
        respond_with User.find(params[:id])
    end
end
