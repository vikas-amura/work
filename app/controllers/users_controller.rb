class UsersController < ApplicationController
   
  layout "user_layout"
  def index
  	 @user = User.new
  end

  def profile
  	 @user = User.new
  end

  def create
		#render plain:params[:user].inspect
		@user = User.new(user_params)
		
		if @user.save
			flash[:notice] = 'Data Save SucessFully!!!!'
			render 'index'
		else
			render 'index'
		end		
	end

	private
	def set_pages
		@user=User.find(params[:id])		
	end
	def user_params
	params.require(:user).permit(:name, :email,:phone,:message)
	end

end
