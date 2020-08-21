require 'rails_helper'

describe Address do
  describe '#create' do
    it "address_first_name, address_family_name, address_first_name_kana, address_family_name_kana, post_code,
    prefecture_code, city, house_numberが存在すれば登録できること" do
      address = build(:address)
      user = create(:user)
      expect(address).to be_valid
    end

    it "address_first_nameが空では登録できない" do
      address = build(:address, address_first_name: nil)
      address.valid?
      expect(address.errors[:address_first_name]).to include("can't be blank")
    end

    it "address_family_nameが空では登録できない" do
      address = build(:address, address_family_name: nil)
      address.valid?
      expect(address.errors[:address_family_name]).to include("can't be blank")
    end

    it "address_first_name_kanaが空では登録できない" do
      address = build(:address, address_first_name_kana: nil)
      address.valid?
      expect(address.errors[:address_first_name_kana]).to include("can't be blank")
    end

    it "address_family_name_kanaが空では登録できない" do
      address = build(:address, address_family_name_kana: nil)
      address.valid?
      expect(address.errors[:address_family_name_kana]).to include("can't be blank")
    end

    it "post_codeが空では登録できない" do
      address = build(:address, post_code: nil)
      address.valid?
      expect(address.errors[:post_code]).to include("can't be blank")
    end

    it "prefecture_codeが空では登録できない" do
      address = build(:address, prefecture_code: nil)
      address.valid?
      expect(address.errors[:prefecture_code]).to include("can't be blank")
    end

    it "cityが空では登録できない" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    it "house_numberが空では登録できない" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("can't be blank")
    end

  end
end