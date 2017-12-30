class CertificatesController < ApplicationController
  before_action :auth_mentor_view, except: [:show]
  layout "certif", only: [:show]

  def index
    @certificates = Certificate.all.order(:id)
  end

  def show
    @certificate = Certificate.find(params[:id])
  end
end
