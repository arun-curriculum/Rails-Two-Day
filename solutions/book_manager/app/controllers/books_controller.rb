class BooksController < ApplicationController
	def index
		@books = Book.all
		render "index"
	end

	def edit
		@book = Book.find(params[:id])
		render "edit"
	end

	def add
		Book.create(title: params[:title], author: params[:author], genre: params[:genre], pages: params[:pages])

		redirect_to "/"
	end

	def update
		book = Book.find(params[:id])

		if book.update_attributes(title: params[:title], author: params[:author], genre: params[:genre], pages: params[:pages])
			redirect_to "/"
		else
			#Your code here to handle any errors
		end
	end

	def destroy
		book = Book.find(params[:id])

		if book
			book.destroy
			redirect_to "/"
		else
			#Handle your errors here
		end
	end
end
