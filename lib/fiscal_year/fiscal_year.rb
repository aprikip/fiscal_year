module AprikipFiscalYear
  require "date"
  AprikipFiscalYear::Date=Date
  class FiscalYear
    include Comparable
    attr_reader :year
    FiscalYear::Date=Date

    def initialize(year=Date::today.year)
      if year.nil?
        @year = Date::today.month<4 ? Date::today.year-1 : Date::today.year
      else
        @year=year
      end
    end
    def succ
      FiscalYear.new(@year+1)
    end
    alias next succ
    def prev
      FiscalYear.new(@year-1)
    end
    def to_i
      @year
    end
    def <=>(other)
      self.to_i <=> other.to_i
    end
    def <(other)
      self.to_i < other.to_i
    end
    def >(other)
      self.to_i > other.to_i
    end
    def <=(other)
      self.to_i <= other.to_i
    end
    def >=(other)
      self.to_i >= other.to_i
    end
    def ==(other)
      self.to_i == other.to_i
    end
    def first_date
      Date.new(@year, 4, 1)
    end
    def last_date
      Date.new(@year+1, 3, 31)
    end
    def size
      if (@year+1) % 4 == 0
        366
      else
        365
      end
    end
    alias length size
    def +(other)
      FiscalYear.new(@year+other)
    end
    def -(other)
      if other.class==Fixnum
        FiscalYear.new(@year-other)
      elsif other.class==FiscalYear
        self.to_i-other.to_i
      end
    end
    def include?(date)
      self.first_date <= date && date <= self.last_date
    end
    def dates
      self.first_date..self.last_date
    end
  end
  class Date
    def fiscal_year
      if self.month<4
        FiscalYear.new(self.year-1)
      else
        FiscalYear.new(self.year)
      end
    end
  end
end