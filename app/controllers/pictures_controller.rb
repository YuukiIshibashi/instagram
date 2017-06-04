class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_picture, only: [:edit, :update, :destroy]

  def new
    @picture = Picture.new
  end


  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @picture.update(pictures_params)
    redirect_to blogs_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path
  end

  def mypage
    @user = current_user
    @pictures = Picture.where(user_id: current_user.id)
  end

  private
    def pictures_params
      params.require(:picture).permit(:title, :content, :image, :user_id)
    end

    def set_picture
      @pictures = Picture.find(params[:id])
    end

end
