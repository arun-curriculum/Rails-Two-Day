class UsersController < ApplicationController
	def login_index
		render "login-index"
	end

	def register_index
		render "register"
	end

	def login_process
		user = User.where(username: params[:username]).first

		if user
			if user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to "/"
			else
				flash[:error] = "Password is incorrect"
				redirect_to "/login"
			end
		else
			flash[:error] = "User does not exist"
			redirect_to "/login"
		end
	end

	def register_process
		user = User.create(name: params[:name], username: params[:username], password: params[:password])

		if user.errors.first
			flash[:error] = user.errors
			redirect_to "/login"
		else
			flash[:success] = "Thanks for creating your account. Please log in."
			redirect_to "/login"
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to "/login"
	end
end
