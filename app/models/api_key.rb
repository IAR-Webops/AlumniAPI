class ApiKey < ActiveRecord::Base
    belongs_to :app

    before_create :generate_token


    private

        def generate_token
            begin
                self.token = SecureRandom.hex.to_s
            end whie self.class.exists?(token: token)
        end

end
