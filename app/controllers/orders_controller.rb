class OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def new; end

  # create order list according to product select
	def create
		order = Order.new(order_params)
		order.save ? (redirect_to orders_path, flash: {notice: 'Order created successfully'}) : (redirect_to new_order_path, flash: {error: order.errors.full_messages.to_sentence})
	end

  # generating the pdf format for sales taxes
	def show
		@order = Order.find(params[:id])
		respond_to do |format|
      format.html
      format.pdf do
        # pdf name with order_number
        render pdf: "order_#{@order.order_number}"
      end
    end
	end

	private
		def order_params
			params.require(:order).permit(:order_number, order_items_attributes: [:item_name, :quantity, :cost, :sale_tax, :import_tax, :_destroy])
		end
end
