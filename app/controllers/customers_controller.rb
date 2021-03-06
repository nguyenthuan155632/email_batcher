class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all.order(updated_at: :desc).page(params[:page]).per(50)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_path, notice: 'Customer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_single_mail
    ids = []
    ids << params[:id]
    EmailWorker.perform_async(ids)
  end

  def send_multi_mail
    if params[:max].present?
      arr = Customer.offset(params[:min].to_i).limit(params[:max].to_i).pluck(:id)
    else
      arr = Customer.offset(params[:min].to_i).pluck(:id)
    end
    q = 8
    sl = (arr.size % q != 0) ? (arr.size / q + 1) : (arr.size / q)
    slice = arr.each_slice(sl).to_a
    slice.each do |ids|
      EmailWorker.perform_async(ids)
    end
  end

  def send_all_mail
    arr = Customer.all.pluck(:id)
    q = 8
    sl = (arr.size % q != 0) ? (arr.size / q + 1) : (arr.size / q)
    slice = arr.each_slice(sl).to_a
    slice.each do |ids|
      EmailWorker.perform_async(ids)
    end
  end

  def import
    if params[:file].present?
      imp = Customer.import(params[:file])
      if imp.empty?
        flash[:notice] = "Customers imported!"
        redirect_to customers_path
      else
        flash[:error] = imp
        redirect_to customers_path
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :email, :status)
    end
end
