class PostersController < ApplicationController
  before_action :set_poster, only: %i[ show edit update destroy like ]

  # GET /posters or /posters.json
  def index
    @posters = Poster.all
  end

  # GET /posters/1 or /posters/1.json
  def show
  end

  # GET /posters/new
  def new
    @poster = Poster.new
  end

  # GET /posters/1/edit
  def edit
  end
  
  def like
    respond_to do |format|
      if @poster.update(score: @poster.score+1)
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

    # Only allow a list of trusted parameters through.
    def poster_params
      params.require(:poster).permit(:name, :score, :image)
    end
end
