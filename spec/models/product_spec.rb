require 'rails_helper'

RSpec.describe Product, type: :model do
  # validation
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
end