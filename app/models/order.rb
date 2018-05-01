class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true

  # total cost of order items for particular order
  def cost_total
  	order_items.pluck(:cost).sum().to_f
  end

  # sales tax for the particular order
  def sale_tax_total
  	order_items.pluck(:sale_tax).sum().to_f
  end
end