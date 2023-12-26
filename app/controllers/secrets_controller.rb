class SecretsController < ApplicationController
  before_action :set_secret, only: [:show]

  # GET /secrets/new
  def new
    @secret = Secret.new
  end

  def show
  end

  def burn
    binding.break
  end

  # POST /secrets or /secrets.json
  def create
    @secret = Secret.new(secret_params)

    respond_to do |format|
      if @secret.save
        format.html { redirect_to @secret, notice: "Secret was successfully created." }
        format.turbo_stream
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_secret
    @secret = Secret.where(access_token: params[:token]).take
  end

  # Only allow a list of trusted parameters through.
  def secret_params
    params.require(:secret).permit(:content)
  end
end
