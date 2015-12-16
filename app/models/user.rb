class User < ActiveRecord::Base
	before_save {self.email=email.downcase}
	has_many:articles
	validates :name, presence: true, uniqueness:{case_sensitive:false}, length: {minimum: 3, maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true , uniqueness:{case_sensitive:false}, length: {maximum: 105},
    		  format:{ with: VALID_EMAIL_REGEX}
    validates :phone, presence: true, length: {minimum: 10}
    validates :message, presence: true, length: {minimum: 10, maximum: 300}

	has_secure_password
end
