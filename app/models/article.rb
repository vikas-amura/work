class Article < ActiveRecord::Base
	belongs_to:user	
	validates  :title ,presence:true ,length:{minimux:5,maximum:50}
	validates  :description ,presence:true
	validates  :user_id ,presence:true
end
