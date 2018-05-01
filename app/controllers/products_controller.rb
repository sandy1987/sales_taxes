class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def new; end

	# creating the new product
	def create
		product = Product.new(product_params)
		product.save ? (redirect_to products_path, flash: {notice: 'Product created successfully'}) : (redirect_to new_product_path, flash: {error: 'product.errors.full_messages.to_sentence'})
	end

	private
		def product_params
	    params.require(:product).permit(:name, :price, :sale_tax, :import_tax)
	  end
end