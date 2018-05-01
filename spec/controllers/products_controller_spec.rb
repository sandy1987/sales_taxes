require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before(:each) do
    current_user
  end

  describe "POST #create" do
    it "responds to products path after create when valid fields" do
      post :create, params: { product: { name: 'Demo Product', price: 3.0, sale_tax: 2.0, import_tax: 0.5 } }

      expect(Product.last.name).to eq("Demo Product")
      expect(response).to redirect_to(products_url)
    end
    it "responds to new products path when invalid fields" do
      post :create, params: { product: { name: 'Demo Product', sale_tax: 2.0, import_tax: 0.5 } }

      expect(Product.last).to eq(nil)
      expect(response).to redirect_to(new_product_url)
    end
  end

  describe "GET #index" do
    it "Listing out the all product list" do
      product1, product2 = create(:product), create(:product)

      get :index

      expect(assigns(:products).count).to eq(2)

      expect(response).to be_success
    end
  end
end