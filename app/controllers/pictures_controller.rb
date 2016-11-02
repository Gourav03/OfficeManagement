class PicturesController < ApplicationController
 
  def index

    @gallery = Gallery.find(params[:gallery_id])

    @pictures = @gallery.pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  def edit
    @picture = Picture.find(params[:id])   
  end

  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      respond_to do |format|
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@picture.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def update

    @gallery = Gallery.find(params[:gallery_id])

    @picture = @gallery.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(picture_params)
        format.html { redirect_to gallery_path(@gallery), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy    
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to galleries_path    
  end

  def make_default
    @picture = Picture.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])

    @gallery.cover = @picture.id
    @gallery.save

    respond_to do |format|
      format.js
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:description, :gallery_id, :image)
  end
end
