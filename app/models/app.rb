class App < ActiveRecord::Base

    before_create :create_secret_token, :create_secret_id

    belongs_to :dev, inverse_of: :apps

    validates :name, presence: true, length: {maximum: 50}
    validates :secret_id, presence: true, uniqueness: true
    validates :secret_token, presence: true, uniqueness: true
    validates :access_level, presence: true


    def App.new_secret_token
        SecureRandom.urlsafe_base64
    end

    def App.new_secret_id
        SecureRandom.random_number(10**10)
    end

    def App.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private

    def create_secret_token
        self.secret_token = App.digest(App.new_secret_token)
    end
    
    def create_secret_id
        self.secret_id = App.new_secret_id
    end
end
