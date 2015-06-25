class AppsController < ApplicationController

    def new
    end

    def show
        @app = App.find(params[:id])
    end

    def create
        app = App.new
        app.name = params[:app][:name]
        app.dev_id = current_dev.id
        if app.save
            redirect_to app_path(app)
        else
            flash[:error] = "Sorry, there was an error while creating your app. Please try again."
            render 'new'
        end
    end

end
