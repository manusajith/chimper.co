class VoteController < ApplicationController
  before_filter :authenticate_user!

  def upvote
    @image = Image.find params[:image_id]
    @image.liked_by current_user
    flash[:success] = "Thanks for voting..!!"
    redirect_to @image
  end

  def downvote
    @image = Image.find params[:image_id]
    @image.downvote_from current_user
    flash[:success] = "Thanks for voting..!!"
    redirect_to @image
  end
end
