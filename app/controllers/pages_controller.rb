class PagesController < ApplicationController

	before_action :set_pages ,only:[:edit,:update,:destroy,:show]
	def new
		@page = Page.new
	end
	def index
		@pages=Page.all
	end
	def create
		#render plain:params[:page].inspect
		@page = Page.new(page_params)
		
		if @page.save
			flash[:notice] = 'Data Save SucessFully!!!!'
			redirect_to page_path(@page)
		else
			render 'new'
		end		
	end

	def show
		#@page=Page.find(params[:id])		
	end

	def edit
		#@page=Page.find(params[:id])
	end

	def update
		#@page=Page.find(params[:id])

		if @page.update(page_params)
			flash[:notice]="Save Successfully updated"
			redirect_to page_path(@page)
		else
			render 'edit'
		end
	end

	def destroy
		#@page=Page.find(params[:id])		
		@page.destroy
		flash[:notice]="Record Successfully Deleted!!!!"
		redirect_to pages_path
	end
		
	

	private
	def set_pages
		@page=Page.find(params[:id])		
	end

	def page_params
	params.require(:page).permit(:title, :description)
	end

end