ActiveRecord::Base.establish_connection

class User < ActiveRecord::Base
    has_secure_password
    has_many :wakeupTime
end

class WakeupTime < ActiveRecord::Base
    belongs_to :user
end

class Food < ActiveRecord::Base
end