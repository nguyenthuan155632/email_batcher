class EmailTemplatesController < ApplicationController
  before_action :set_email_template, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token  

  # GET /email_templates
  # GET /email_templates.json
  def index
    @email_templates = EmailTemplate.all.order(updated_at: :desc).page(params[:page]).per(10)
    @et = if params[:et].present?
      EmailTemplate.find(params[:et].to_i)
    else
      EmailTemplate.find(Setting.find_by_key('email_template').value.to_i)
    end
  end

  # GET /email_templates/1
  # GET /email_templates/1.json
  def show
  end

  # GET /email_templates/new
  def new
    @email_template = EmailTemplate.new
  end

  # GET /email_templates/1/edit
  def edit
  end

  # POST /email_templates
  # POST /email_templates.json
  def create
    @email_template = EmailTemplate.new(email_template_params)

    respond_to do |format|
      if @email_template.save
        format.html { redirect_to email_templates_path, notice: 'Email template was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /email_templates/1
  # PATCH/PUT /email_templates/1.json
  def update
    respond_to do |format|
      if @email_template.update(email_template_params)
        format.html { redirect_to email_templates_path, notice: 'Email template was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /email_templates/1
  # DELETE /email_templates/1.json
  def destroy
    @email_template.destroy
    respond_to do |format|
      format.html { redirect_to email_templates_url, notice: 'Email template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def choose_template
    email_tpl_setting = Setting.find_by_key("email_template")
    email_tpl_setting.value = params[:choose_template]
    email_tpl_setting.save!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_template
      @email_template = EmailTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_template_params
      params.require(:email_template).permit(:title, :content)
    end
end
