class Access::V1::UsersController < ApplicationController
    skip_before_filter :require_signin
    respond_to :json

    def show
        if User.exists?(params[:id])
            @user = User.find(params[:id])
            render json: @user, status: 201, location: [:access, @user]
        else
            render json: { errors: "User not found in database" }, status: 404
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @user_email = UserEmail.new(user_email_params)
            @user_email.user_id = @user.id
            if @user_email.save
                render json: @user, status: 201, location: [:access, @user]
            else
                render json: { errors: @user_email.errors }, status: 422
            end
        else
            render json: { errors: @user.errors }, status: 422
        end
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            render json: @user, status: 200, location: [:access, @user]
        else
            render json: { errors: @user.errors }, status: 422
        end
    end

    def destroy
        @user = User.find(params[:id])
        
        if @user.update(deleted: true)
            head 204
        else
            render json: { errors: "There was some error and the user could not be deleted." }, status: 422
        end
    end

    private

        def user_params
            params.permit(:rollno)
        end

        def user_email_params
            params.permit(:user_email)
        end
end
