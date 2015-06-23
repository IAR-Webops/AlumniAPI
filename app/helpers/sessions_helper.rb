module SessionsHelper

    def sign_in(dev)
        remember_token = Dev.new_remember_token
        cookies.permanent[:remember_token] = remember_token
        dev.update_attribute(:remember_token, dev.digest(remember_token))
        self.current_dev = dev
    end

    def sign_out
        current_dev.update_attribute(:remember_token,
                                      Dev.digest(Dev.new_remember_token))
        cookies.delete(:remember_token)
        self.current_dev = nil
    end

    def signed_in?
        !current_dev.nil?
    end

    def current_dev=(dev)
        @current_dev = dev
    end

    def current_dev
        remember_token = Dev.digest(cookies[:remember_token])
        @current_dev ||= Dev.find_by(remember_token: remember_token)
    end

    def current_dev?(dev)
        current_dev==dev
    end

end
