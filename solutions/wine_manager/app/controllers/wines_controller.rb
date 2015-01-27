class WinesController < ApplicationController

	def index
		request = Typhoeus::Request.new(
			"http://1f19ea54.ngrok.com/wines",
			method: :get
		)
		request.run
		@wines = JSON.parse(request.response.body)
	end

	def edit
		request = Typhoeus::Request.new(
			"http://1f19ea54.ngrok.com/wines/" + params[:id],
			method: :get
		)
		request.run
		@wine = JSON.parse(request.response.body)
	end

	def create
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
	end

	def update
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
	end

	def destroy
		request = Typhoeus::Request.new(
			"http://1f19ea54.ngrok.com/wines/" + params[:id],
			method: :delete
		)
		request.run

		redirect_to "/"
	end

end
