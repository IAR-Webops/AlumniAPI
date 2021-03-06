class Identity < ActiveRecord::Base
    belongs_to :dev

    validates :uid, presence: true
    validates :provider, presence: true
    validates :dev_id, presence: true

    def self.find_with_omniauth(auth)
        find_by(uid: auth['uid'], provider: auth['provider'])
    end

    def self.create_with_omniauth(auth)
        create(uid: auth['uid'], provider: auth['provider'])
    end

end
