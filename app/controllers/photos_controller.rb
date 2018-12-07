class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.order(:created_at).page(params[:page])
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    #@photos_full_view = Photo.find(params[:id])
    @comments = @photo.comments.all
    @comment = @photo.comments.build
  end

  def view
    @photo = Photo.find(params[:id])
  end


  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Zdjęcie zostało dodane.' }
        format.json { render action: 'Pokaż', status: :created, location: @photo }
      else
        format.html { render action: 'Nowe' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Zdjęcie zostało zmienione.' }
        format.json { head :no_content }
      else
        format.html { render action: 'Edytuj' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:user_name, :title, :image_url, :description, :technical_info)
    end
end
