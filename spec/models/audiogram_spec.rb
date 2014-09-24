# coding: utf-8
require 'rails_helper'

describe Audiogram do
  context "valid data の場合" do
    it "保存できること" do
      audiogram = FactoryGirl.build(:audiogram)
      expect(audiogram.save).to be true
    end
  end

  context "examdate がない場合" do
    it "保存できないこと" do
      audiogram = FactoryGirl.build(:audiogram, :examdate => nil)
      expect(audiogram.save).to be false
    end
  end

  context "audiometer がない場合" do
    it "保存できないこと" do
      audiogram = FactoryGirl.build(:audiogram, :audiometer => nil)
      expect(audiogram.save).to be false
    end
  end
end
