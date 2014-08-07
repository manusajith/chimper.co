class AccountsController < ApplicationController
	before_action :set_user, only: [:edit, :update]
	before_action :fetch_user, only: [:show]

	def show
		@images = @user.images
	end

	def edit
	end

	def update
		if @user.update(account_params)
			flash[:success] = "Profile has been successfully updated.!!"
			redirect_to account_path(@user)
		else
			flash[:error] = @user.errors.full_messages.to_sentence
			render :edit
		end
	end


	private

	def fetch_user
		@user = User.find params[:id]
	end

	def set_user
		@user = current_user
	end

	def account_params
		params.require(:user).permit(profile_attributes:[:first_name, :last_name,
		                                                 :dob, :bio, :website	])
	end
end
