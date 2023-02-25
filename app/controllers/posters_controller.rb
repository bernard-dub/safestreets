class PostersController < ApplicationController
  before_action :set_poster, only: %i[ show edit update destroy like unlike ]
  before_action :set_likes, only: %i[ index tagged show create update status ]
  before_action :set_tags, only: %i[ index tagged status ]
  before_action :authenticate_admin!, only: %i[ edit update destroy delete_likes_cookies status ]
  
  # GET /posters or /posters.json
  def index
    if current_admin
      @posters = Poster.all.order(updated_at: :desc)
    else
      @posters = Poster.validated.order(score: :desc)
    end  
  end
  
  def tagged
    @posters = Poster.tagged_with(params['tag']).order(score: :desc)
    render "index"
  end
  
  def status
    @posters = Poster.where(status: params['status']).order(score: :desc)
    render "index"
  end
  
  def delete_likes_cookies
    cookies[:likes] = nil
    redirect_to posters_url
  end

  # GET /posters/1 or /posters/1.json
  def show
  end

  # GET /posters/new
  def new
    @poster = Poster.new
    if current_admin
      @poster.email = current_admin.email
      @poster.status = 'validated'
    end
  end

  # GET /posters/1/edit
  def edit
  end
  
  def like
    likes = cookies[:likes].blank? ? [] : JSON.parse(cookies[:likes])
    respond_to do |format|
      if !likes.include?(@poster.id) && @poster.update(score: @poster.score+1)
        likes.append(@poster.id)
        cookies[:likes] = JSON.generate(likes)
        format.html { redirect_to posters_url }
        format.json { render :list, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def unlike
    likes = cookies[:likes].blank? ? [] : JSON.parse(cookies[:likes])
    respond_to do |format|
      if likes.include?(@poster.id) && @poster.update(score: @poster.score-1)
        likes.delete(@poster.id)
        cookies[:likes] = JSON.generate(likes)
        format.html { redirect_to posters_url }
        format.json { render :list, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /posters or /posters.json
  def create
    @poster = Poster.new(poster_params)

    respond_to do |format|
      if @poster.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("confirm_submit", partial: "posters/confirm_submit"), notice: "Poster was successfully created."
          render turbo_stream: turbo_stream.prepend("posters", partial: "posters/poster", locals: {poster: @poster}) if current_admin
        end
        format.html { redirect_to poster_url(@poster), notice: "Poster was successfully created." }
        format.json { render :show, status: :created, location: @poster }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posters/1 or /posters/1.json
  def update
    respond_to do |format|
      if @poster.update(poster_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend("posters", partial: "posters/poster", locals: {poster: @poster})
        end
        format.html { redirect_to poster_url(@poster), notice: "Poster was successfully updated." }
        format.json { render :show, status: :ok, location: @poster }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posters/1 or /posters/1.json
  def destroy
    @poster.destroy

    respond_to do |format|
      format.html { redirect_to posters_url, notice: "Poster was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poster
      @poster = Poster.find(params[:id])
    end
    
    def set_likes
      @likes = cookies[:likes].blank? ? [] : (JSON.parse(cookies[:likes]))
    end
    
    def set_tags
      @tags = ActsAsTaggableOn::Tag.all.order(:name)
    end

    # Only allow a list of trusted parameters through.
    def poster_params
      if current_admin
        params.require(:poster).permit(:name, :email, :score, :image, :pdf, :place_list, :status)
      else
        params.require(:poster).permit(:name, :email)
      end
    end
end
