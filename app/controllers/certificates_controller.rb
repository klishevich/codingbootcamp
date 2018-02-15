class CertificatesController < ApplicationController
  before_action :auth_mentor_view, only: [:index]
  before_action :auth_mentor, only: [:new, :create, :edit, :update]
  layout "certif", only: [:show]

  def index
    @certificates = Certificate.all.order(:id)
  end

  def show
    @certificate = Certificate.find(params[:id])
  end

  def new
    if params[:id]
      old_cert = Certificate.find(params[:id])
      @certificate = old_cert.dup
      @certificate.student = ''
      @certificate.issue_date = Date.today
    else
      @certificate = Certificate.new
    end
  end

  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.save
      flash[:notice] = t(:created_successfuly)
      redirect_to certificates_path
    else
      render 'new'
    end
  end

  def edit
    @certificate=Certificate.find(params[:id])
  end

  def update
    @certificate = Certificate.find(params[:id])
    if @certificate.update_attributes(certificate_params)
      flash[:notice] = t(:saved_successfuly)
      redirect_to certificates_path
    else
      render 'edit'
    end
  end

  private

  def certificate_params
    params.require(:certificate).permit(:student,
                                        :course_title,
                                        :course_desc,
                                        :mentors,
                                        :issue_date)
  end
end
