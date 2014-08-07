class ImagesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @images = Image.todays
  end

  def trending
    @images = Image.trending
    render :index
  end

  def popular
    @images = Image.popular
    render :index
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new image_params
    @image.user = current_user
    if @image.save!
      flash[:success] = "Image have been uploaded"
      redirect_to @image
    else
      flash[:error] = @image.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    set_image
    check_user
  end

  def update
    set_image
    check_user
    if @image.update_attributes image_params
      flash[:success] = "Image has been updated...!"
      redirect_to @image
    else
      flash[:error] = @image.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
    set_image
  end

  def destroy
    set_image
    check_user
    if @image.destroy
      flash[:success] = "Image has been destroyed.."
    else
      flash[:error] =  @image.errors.full_messages.to_sentence
    end
    redirect_to images_path
  end

  private

  def check_user
    if @image.user != current_user
      flash[:error] = "You dont have permission for that action..!"
      redirect_to images_path
    end
  end

  def set_image
    @image = Image.find params[:id]
  end

  def image_params
    params.require(:image).permit(:name,:photo)
  end
end
