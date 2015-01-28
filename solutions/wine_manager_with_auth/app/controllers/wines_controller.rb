class WinesController < ApplicationController

	def index
		if session[:user_id]
			request = Typhoeus::Request.new(
				"http://1f19ea54.ngrok.com/wines",
				method: :get
			)
			request.run
			@wines = JSON.parse(request.response.body)
		else
			flash[:error] = "You need to be logged in!"
			redirect_to "/login"
		end
	end

	def edit
		if session[:user_id]
			request = Typhoeus::Request.new(
				"http://1f19ea54.ngrok.com/wines/" + params[:id],
				method: :get
			)
			request.run
			@wine = JSON.parse(request.response.body)
		else
			flash[:error] = "You need to be logged in!"
			redirect_to "/login"
		end
	end

	def create
		if session[:user_id]
			request = Typhoeus::Request.new(
				"http://1f19ea54.ngrok.com/wines",
				method: :post,
				params: {
					name: params[:name],
					year: params[:year],
					grapes: params[:grapes],
					country: params[:country],
					region: params[:region],
					price: params[:price],
					picture: params[:picture],
					description: params[:description]
				}
			)
			request.run

			redirect_to "/"
		else
			flash[:error] = "You need to be logged in!"
			redirect_to "/login"
		end
	end

	def update
		if session[:user_id]
			request = Typhoeus::Request.new(
				"http://1f19ea54.ngrok.com/wines/" + params[:id],
				method: :put,
				params: {
					name: params[:name],
					year: params[:year],
					grapes: params[:grapes],
					country: params[:country],
					region: params[:region],
					price: params[:price],
					picture: params[:picture],
					description: params[:description]
				}
			)
			request.run

			redirect_to "/"
		else
			flash[:error] = "You need to be logged in!"
			redirect_to "/login"
		end
	end

	def destroy
		if session[:user_id]
			request = Typhoeus::Request.new(
				"http://1f19ea54.ngrok.com/wines/" + params[:id],
				method: :delete
			)
			request.run

			redirect_to "/"
		else
			flash[:error] = "You need to be logged in!"
			redirect_to "/login"
		end
	end

end
