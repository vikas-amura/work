class PagesController < ApplicationController

	def new
		@pages = Page.new
	end
	def index
	end
	def create
		#render plain:params[:page].inspect
		@pag = Page.new(page_params)
		
		if @pag.save
			flash[:notice] = 'Data Save SucessFully!!!!'
			redirect_to page_path(@pag)
		else
			render 'new'
		end

		

	end
	def show
		@page=Page.find(params[:id])
		
	end
	private

	private
	def page_params
	params.require(:page).permit(:title, :description)
	end

end