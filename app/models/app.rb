class App < ActiveRecord::Base

    after_initialize :create_secret_key, :create_secret_id

    belongs_to :dev, inverse_of: :apps

    validates :name, presence: true, length: {maximum: 50}
    validates :secret_id, presence: true, uniqueness: true
    validates :secret_key, presence: true, uniqueness: true
    validates :access_level, presence: true


    def App.new_secret_key
        SecureRandom.urlsafe_base64
    end

    def App.new_secret_id
        SecureRandom.random_number(10**10)
    end

    def App.digest(key)
        Digest::SHA1.hexdigest(key.to_s)
    end

    private

    def create_secret_key
        self.secret_key = App.digest(App.new_secret_key)
    end
    
    def create_secret_id
        self.secret_id = App.new_secret_id
    end
end
