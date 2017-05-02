class PhotosController < ApplicationController

  #The params has looks like this: {"id_number"=>"1"}
  def index
    @all_photos = Photo.all.order({:created_at => :desc})
    render("photos/index.html.erb")
  end

  def show
    p = Photo.find(params["id_number"])

    @caption = p.caption
    @image_url = p.source
    @created_at = p.created_at

    render("photos/show.html.erb")
  end

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row

    p = Photo.new
    p.source = params["the_image_url"]
    p.caption = params["the_caption"]
    #MUST USE p.save TO ACTUALLY INSERT ROW INTO THE TABLE
    p.save
    # render("photos/create_row.html.erb")
    # instead of directing to a view tempalte file, direct to an address (URL) with...
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @photo_to_be_edited = Photo.find(params[:id_number])
    render("/photos/edit_form.html.erb")
  end

  def update_row
    p = Photo.find(params[:id_number])

    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save
    redirect_to("/photos")
  end

  def delete_row
    p = Photo.find(params[:id_number])
    p.delete
    redirect_to("/photos")
  end

end
