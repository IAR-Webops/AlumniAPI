class Dev < ActiveRecord::Base

    has_many :apps, inverse_of: :dev

    before_create :create_remember_token

    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

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
