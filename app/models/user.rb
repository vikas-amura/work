class User < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 3, maximum: 50}
    validates :email, presence: true
    validates :phone, presence: true, length: {minimum: 10}
    validates :message, presence: true, length: {minimum: 10, maximum: 300}
end
