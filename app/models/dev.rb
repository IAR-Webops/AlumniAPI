class Dev < ActiveRecord::Base

    before_create :create_remember_token

    has_many :apps, inverse_of: :dev

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :access_level, presence: true, default: 4

    def Dev.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def Dev.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private

    def create_remember_token
        self.remember_token = Dev.digest(Dev.new_remember_token)
    end
end
