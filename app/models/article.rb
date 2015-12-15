class Article < ActiveRecord::Base
	validates  :title ,presence:true ,length:{minimux:5,maximum:50}
	validates  :description ,presence:true
end
