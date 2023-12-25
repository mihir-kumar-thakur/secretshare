class SecretsController < ApplicationController
  # GET /secrets/new
  def new
    @secret = Secret.new
  end

  def show
    @secret = Secret.where(access_token: params[:id]).first
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
  # def set_secret
  #   @secret = Secret.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def secret_params
    params.require(:secret).permit(:content)
  end
end
