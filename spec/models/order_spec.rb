require 'rails_helper'

RSpec.describe Order, type: :model do
  # associations
  it { should have_many(:order_items).dependent(:destroy) }
  # nested attributes
  it{ should accept_nested_attributes_for(:order_items).allow_destroy(true) }

  # methods
  context "methods" do
    before do
      @order = create(:order)
      (1..5).each do
        create(:order_item, order_id: @order.id)
      end
    end

    it "can be calculate the total cost" do
      expect(@order.cost_total).to eq(12.5)
    end

    it "can be calculate the total cost" do
      expect(@order.sale_tax_total).to eq(5.0)
    end
  end
end