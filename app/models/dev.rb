class Dev < ActiveRecord::Base

    before_create :create_remember_token

    has_many :identities, inverse_of: :dev, dependent: :destroy
    has_many :apps, inverse_of: :dev, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: {maximum: 50}
    validates :access_level, presence: true

    def Dev.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def Dev.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    def Dev.create_with_omniauth(info)
        create(name: info['name'])
    end

    private

    def create_remember_token
        self.remember_token = Dev.digest(Dev.new_remember_token)
    end
end
