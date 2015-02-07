require 'rails_helper'

RSpec.describe Tympanogram, :type => :model do
  context "valid data の場合" do
    it "保存できること" do
      tympanogram = FactoryGirl.build(:tympanogram)
      expect(tympanogram.save).to be true
    end
  end

  context "examdate がない場合" do
    it "保存できないこと" do
      tympanogram = FactoryGirl.build(:tympanogram, :examdate => nil)
      expect(tympanogram.save).to be false
    end
  end

  context "impedancemeter がない場合" do
    it "保存できないこと" do
      tympanogram = FactoryGirl.build(:tympanogram, :impedancemeter => nil)
      expect(tympanogram.save).to be false
    end
  end

end
