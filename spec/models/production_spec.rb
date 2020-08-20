require 'rails_helper'
describe Production do
  describe '#create' do

    it "is valid with a name, price, introduction, size, shipping_charge, prefecture_code, detail_date, trading_status, category_id, user_id" do
      user = create(:user)
      category = create(:category)
      production = FactoryBot.build(:production, user_id: user[:id], category_id: category[:id])
      production.valid?
      expect(production).to be_valid
    end

    it "nameが空では登録できない" do
      production = build(:production, name: nil)
      production.valid?
      expect(production.errors[:name]).to include("can't be blank")
    end
    
    it "priceが空では登録できない" do
      production = build(:production, price: nil)
      production.valid?
      expect(production.errors[:price]).to include("can't be blank")
    end

    it "introductionが空では登録できない" do
      production = build(:production, introduction: nil)
      production.valid?
      expect(production.errors[:introduction]).to include("can't be blank")
    end

    it "sizeが空では登録できない" do
      production = build(:production, size: nil)
      production.valid?
      expect(production.errors[:size]).to include("can't be blank")
    end

    it "shipping_chargeが空では登録できない" do
      production = build(:production, shipping_charge: nil)
      production.valid?
      expect(production.errors[:shipping_charge]).to include("can't be blank")
    end

    it "prefecture_codeが空では登録できない" do
      production = build(:production, prefecture_code: nil)
      production.valid?
      expect(production.errors[:prefecture_code]).to include("can't be blank")
    end

    it "detail_dateが空では登録できない" do
      production = build(:production, detail_date: nil)
      production.valid?
      expect(production.errors[:detail_date]).to include("can't be blank")
    end

    it "trading_statusが空では登録できない" do
      production = build(:production, trading_status: nil)
      production.valid?
      expect(production.errors[:trading_status]).to include("can't be blank")
    end

    it "category_idが空では登録できない" do
      production = build(:production, category_id: nil)
      production.valid?
      expect(production.errors[:category_id]).to include("can't be blank")
    end
   
    xit "imagesが空では登録できない" do
      user = create(:user)
      category = create(:category)
      production = FactoryBot.build(:production, user_id: user[:id], category_id: category[:id])
      binding.pry
      production.valid?
      expect(production.errors[:images]).to include('test')
    end

  end
end