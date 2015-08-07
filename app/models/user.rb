class User < ActiveRecord::Base
    establish_connection :iitmconnect

    validates :rollno, presence: true, length: {maximum: 10}
end
