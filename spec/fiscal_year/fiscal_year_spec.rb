require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "rspec"
require "date"
include AprikipFiscalYear

describe FiscalYear do
  describe "#new" do
    context "Without any argument" do
      it "makes a FiscalYear object of today" do
        expect(FiscalYear.new).to be_a FiscalYear
      end
    end
    context "With an argument" do
      it "makes a FiscalYear object of corresponding to the argument" do
        expect(FiscalYear.new(2044)).to be_a FiscalYear
      end
    end
  end
  describe "#year" do
    context "Without any argument" do
      it "returns year of FiscalYear object of today" do
        expect(FiscalYear.new.year).to eq(Date::today.month<4 ? Date::today.year+1 : Date::today.year)
      end
    end
    context "With an argument" do
      it "returns year of FiscalYear object corresponding to the argument" do
        expect(FiscalYear.new(2044).year).to eq(2044)
      end
    end
  end
  describe "#succ" do
    it "makes a FiscalYear object of next year" do
      expect(FiscalYear.new(2047).succ).to eq(FiscalYear.new(2048))
    end
  end
  describe "#prev" do
    it "makes a FiscalYear object of previous year" do
      expect(FiscalYear.new(2047).prev).to eq(FiscalYear.new(2046))
    end
  end
  describe "#to_i" do
    it "returnmakes a FiscalYear object of previous year" do
      expect(FiscalYear.new(2047).prev).to eq(FiscalYear.new(2046))
    end
  end
  describe "#to_i" do
    context "Without any argument" do
      it "returns year of FiscalYear object of today" do
        expect(FiscalYear.new.to_i).to eq(Date::today.month<4 ? Date::today.year+1 : Date::today.year)
      end
    end
    context "With an argument" do
      it "returns year of FiscalYear object corresponding to the argument" do
        expect(FiscalYear.new(2044).to_i).to eq(2044)
      end
    end
  end
  describe "#<=>" do
    it "compares two FiscalYear objects" do
      expect(FiscalYear.new(2040)<=>FiscalYear.new(2046)).to eq(-1)
      expect(FiscalYear.new(2046)<=>FiscalYear.new(2040)).to eq(1)
      expect(FiscalYear.new(2050)<=>FiscalYear.new(2050)).to eq(0)
    end
  end
  describe "#<" do
    it "compares two FiscalYear objects" do
      expect(FiscalYear.new(2090)<FiscalYear.new(2095)).to be true
      expect(FiscalYear.new(2098)<FiscalYear.new(2095)).to be false
    end
  end
  describe "#>" do
    it "compares two FiscalYear objects" do
      expect(FiscalYear.new(2090)>FiscalYear.new(2095)).to be false
      expect(FiscalYear.new(2098)>FiscalYear.new(2095)).to be true
    end
  end
  describe "#<=" do
    it "compares two FiscalYear objects" do
      expect(FiscalYear.new(2090)<=FiscalYear.new(2095)).to be true
      expect(FiscalYear.new(2098)<=FiscalYear.new(2095)).to be false
      expect(FiscalYear.new(2088)<=FiscalYear.new(2088)).to be true
    end
  end
  describe "#>=" do
    it "compares two FiscalYear objects" do
      expect(FiscalYear.new(2090)>=FiscalYear.new(2095)).to be false
      expect(FiscalYear.new(2098)>=FiscalYear.new(2095)).to be true
      expect(FiscalYear.new(2048)>=FiscalYear.new(2048)).to be true
    end
  end
  describe "#first_date" do
    it "returns a Date object of the first day of fiscal year" do
      expect(FiscalYear.new(2040).first_date).to eq(Date.new(2040, 4, 1))
    end
  end
  describe "#last_date" do
    it "returns a Date object of the last day of fiscal year" do
      expect(FiscalYear.new(2090).last_date).to eq(Date.new(2091, 3, 31))
    end
  end
  describe "#size" do
    it "returns number of days of the fiscal year" do
      expect(FiscalYear.new(2014).size).to eq(365)
      expect(FiscalYear.new(2015).size).to eq(366)
    end
  end
  describe "#==" do
    it "judges the equality of two FiscalYear objects, if years are identical, returns truth" do
      expect(FiscalYear.new==FiscalYear.new).to be true
      expect(FiscalYear.new(2048)==FiscalYear.new(1148)).to be false
    end
  end
  describe "#+" do
    it "returns a FiscalYear object of (other) years after" do
      expect(FiscalYear.new(2077)+10).to eq(FiscalYear.new(2087))
    end
  end
  describe "#-" do
    context "with another FiscalYear object" do
      it "returns a difference of two FiscalYear objects" do
        expect(FiscalYear.new(2047)-FiscalYear.new(2037)).to eq(10)
      end
    end
    context "with an integer" do
      it "returns a FiscalYear object of (other) months before" do
        expect(FiscalYear.new(2067)-10).to eq(FiscalYear.new(2057))
      end
    end
  end
  describe "#include?" do
    it "judges if given Date object belongs to this fiscal year" do
      expect(FiscalYear.new(2087).include?(Date.new(2087, 11 ,14))).to be true
      expect(FiscalYear.new(2087).include?(Date.new(2088, 2 ,14))).to be true
      expect(FiscalYear.new(2087).include?(Date.new(2088, 4 ,14))).to be false
    end
  end
  describe "#dates" do
    it "returns a Range of dates of this month" do
      expect(FiscalYear.new(2045).dates).to eq(Date.new(2045, 4, 1)..Date.new(2046, 3, 31))
    end
  end
end
describe Date do
  describe "#fiscal_year" do
    it "returns a FiscalYear object of that date" do
      expect(Date.new(2034, 5, 3).fiscal_year).to eq(FiscalYear.new(2034))
      expect(Date.new(2034, 3, 3).fiscal_year).to eq(FiscalYear.new(2033))
    end
  end
end
