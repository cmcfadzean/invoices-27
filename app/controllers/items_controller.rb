class ItemsController < ApplicationController
	before_action :set_invoice
	before_action :set_item, except: [:create]

	def create
		@item = @invoice.items.create(item_params)
		redirect_to @invoice, notice: "Item created"
	end

	def destroy
		if @item.destroy
			flash[:success] = "Item was deleted."
		else
			flash[:error] = "Item could not be deleted."
		end
		redirect_to @invoice
	end

	private

	def set_invoice
		@invoice = Invoice.find(params[:invoice_id])
	end

	def set_item
		@item = @invoice.items.find(params[:id])
	end

	def item_params
		params[:item].permit(:title, :description, :price, :qty, :invoice_id)
  end

end
