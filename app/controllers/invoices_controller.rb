class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: %i[ preview show edit update destroy ]

  # GET /invoices or /invoices.json
  def index
    @invoices = current_user.invoices
    @invoiceCount = current_user.invoices.size
    @clients = current_user.clients
  end

  # GET /invoices/1 or /invoices/1.json
  def show
    @invoices = current_user.invoices
    @invoiceCount = current_user.invoices.size
    @clients = current_user.clients
  end

  # GET /invoices/new
  def new
    @invoices = current_user.invoices
    @invoiceCount = current_user.invoices.size
    @clients = current_user.clients
    @invoice = current_user.invoices.build
  end

  # GET /invoices/1/edit
  def edit
    @invoices = current_user.invoices
    @invoiceCount = current_user.invoices.size
    @clients = current_user.clients
  end

  # GET /invoices/1/preview
  def preview
    @invoices = current_user.invoices
    @invoiceCount = current_user.invoices.size
    @clients = current_user.clients
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = current_user.invoices.build(invoice_params)
    @invoice.number = "#{Time.now.to_i}-#{rand.to_s[2..3]}"

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to edit_invoice_path(@invoice), notice: "Invoice was successfully created." }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to edit_invoice_path(@invoice), notice: "Invoice was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:title, :number, :date, :due, :notes, :user_id, :client_id)
    end
end
