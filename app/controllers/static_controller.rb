class StaticController < ApplicationController

    skip_before_filter :require_signin

    def terms
    end

    def home
    end

end
