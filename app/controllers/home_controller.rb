class HomeController < ApplicationController
  skip_filter :authenticate_user!, only: [:about]

	def index
		@images = Image.all
	end

  def about
    
  end
end
