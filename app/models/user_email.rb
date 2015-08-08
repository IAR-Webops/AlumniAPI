class UserEmail < ActiveRecord::Base
    establish_connection :iitmconnect

    belongs_to :user, inverse_of: :user_emails

    validates :user_email, presence: true
    validates :user_id, presence: true
end
