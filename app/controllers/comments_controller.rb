class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def show
    
  end

  def create
    @image = Image.find(params[:image_id])
    @all_comments = @image.comment_threads
    if (params[:comment].has_key?(:parent_id))
      @parent = Comment.find(params[:comment][:parent_id])
    end
    @comment = Comment.build_from(@image, current_user.id, params[:comment][:body])
    @new_comment = Comment.build_from(@image, current_user.id, "")
    if @comment.save
      if @parent
        @comment.move_to_child_of(@parent)
      end
      respond_to do |format|
        format.js
      end
    else
      flash.now[:error] = "Comment was not submitted."
      redirect_to root_path
    end
  end

  def update
    
  end

  def destroy
    
  end

end
