require 'rails_helper'

RSpec.describe Item do
  describe "it can visit an item show page" do
    let(:item) { create(:item) }

    it 'does stuff' do
      expect(item).to eq(item)
    end
  end
end
