class User < ActiveRecord::Base
    establish_connection :iitmconnect

    validates :rollno, presence: true, length: {maximum: 10}
    validates :active, presence: true
end
