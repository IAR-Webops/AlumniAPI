class AppsController < ApplicationController

    before_action -> { check_owner params[:id] }, only: :show

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

    private

        def check_owner(id)
            app = App.find(id)
            unless current_dev.id == app.dev_id
                flash[:notice] = "Sorry, you do not have rights to look into that page."
                redirect_to :back
            end
        end

end
