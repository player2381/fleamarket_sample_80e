require 'rails_helper'
describe Production do
  describe '#create' do
    it "is valid with a name, price, introduction, size, shipping_charge, prefecture_code, detail_date, trading_status, category_id, user_id" do
      user = create(:user)
      category = create(:category)
      production = FactoryBot.build(:production, user_id: user[:id], category_id: category[:id])
      expect(production).to be_valid
    end
  end
end