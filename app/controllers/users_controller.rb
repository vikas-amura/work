class UsersController < ApplicationController
   
  layout "user_layout"
  def index
  	 @user = User.new
  end
  def new
  	@user=User.new
  end

  def profile
  	 @user = User.new
  end
  def display
		@users=User.all
	end

  def create
		#render plain:params[:user].inspect
		@user = User.new(user_params)	
		
		if @user.save
			flash[:notice] = 'Data Save SucessFully!!!!'
			redirect_to action: :index
		else
			render 'new'
		end		
	end

	def show
		@user=User.find(params[:id])		
	end

	def destroy
		@user=User.find(params[:id])		
		@user.destroy
		flash[:notice]="Record Successfully Deleted!!!!"
		redirect_to users_path
	end

	private
	def set_pages
		@user=User.find(params[:id])		
	end
	def user_params
	params.require(:user).permit(:name, :email,:phone,:password)
	end

end
