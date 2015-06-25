class DevsController < ApplicationController

  def dashboard
      @apps = App.where("dev_id=?", current_dev.id)
  end

  def new
  end

end
