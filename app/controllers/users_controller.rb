class UsersController < ApplicationController
 
 	before_action :set_user, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update]

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
		@users=User.paginate(page: params[:page] , per_page: 5)
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
	def edit
		@user=User.find(params[:id])		
	end
	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			flash[:notice]="Save Successfully updated"
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		@user=User.find(params[:id])		
		@user.destroy
		flash[:notice]="Record Successfully Deleted!!!!"
		redirect_to users_path
	end

	private
	def set_user
		@user=User.find(params[:id])		
	end
	def user_params
	params.require(:user).permit(:name, :email,:phone,:password)
	end
	def require_same_user
		if current_user != @user
		flash[:danger] = "You can only edit your own account"
		redirect_to root_path
		end
	end

end
