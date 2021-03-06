class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /donations
  # GET /donations.json
  def index
    # @donations = Donation.all
    @donations = Donation.search(params[:search])
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    @donation = Donation.find(params[:id])
    @comments = @donation.comments.all
    @comment = @donation.comments.build
  end

  # GET /donations/new
  def new
    @donation = Donation.new
    @aviso = nil
  end

  # GET /donations/1/edit
  def edit
    @aviso = "Se quiser alterar as imagens você deve adicionar todas novamente, utilize a tecla shift."
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    if current_user
      @donation.email = current_user.email
      @donation.user = current_user
      current_user.donations << @donation
    end
    respond_to do |format|
      if @donation.save
        format.html { redirect_to donation_path(@donation), notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if donation_params[:images]
        @donation.images.each do |image|
          image.purge
        end
      end
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:title, :description, :street, :detail, :zip, :phone, :email, images: [])
    end
end
