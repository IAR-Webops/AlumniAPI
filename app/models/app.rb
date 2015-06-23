class App < ActiveRecord::Base

    belongs_to :dev, inverse_of: :apps

    validates :name, presence: true, length: {maximum: 50}
    validates :secret_token, presence: true, uniqueness: true

    def App.new_secret_token
        SecureRandom.urlsafe_base64
    end

    def App.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private

    def create_secret_token
        self.secret_token = App.digest(App.new_secret_token)
    end
end
