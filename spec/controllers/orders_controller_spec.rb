require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:each) do
    current_user
    @payload = {
            order: { 
             order_number: Faker::Number.number(10), 
               order_items_attributes: { 
                  "0" => { 
                    item_name: Faker::Name.name, quantity: 2.0, cost: 3.0, sale_tax: 1.0, import_tax: 0.5
                  } 
               } 
             } 
           }
  end

  describe "POST #create" do
    it "responds to orders path after order create" do
      post :create, params: @payload
      
      order = Order.last
      order_item = order.order_items.first

      # order
      expect(order.present?).to eq(true)

      # order_item details
      expect(order.order_items.count).to eq(1)
      expect(order_item.quantity).to eq(2)
      expect(order_item.cost).to eq(3.0)

      # redirect
      expect(response).to redirect_to(orders_url)
    end
  end

  describe "GET #show" do
    it "find the order" do
      order = create(:order)

      get :show, params: { id: order.id}, xhr: true

      expect(assigns(:order).present?).to eq(true)
      
      expect(response).to be_success
    end
  end

  describe "GET #index" do
    it "Listing out the all orders list" do
      order = create(:order)
      (0..5).each do
        create(:order_item, order_id: order.id)
      end
      
      get :index

      expect(assigns(:orders).count).to eq(1)
      expect(order.order_items.count).to eq(6)

      expect(response).to be_success
    end
  end
end