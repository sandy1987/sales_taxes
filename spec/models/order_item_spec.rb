require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  # associtaion
  it { should belong_to(:order)}
end