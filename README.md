# FiscalYear

This gem provides a class manipulates the fiscal year in Japan, which begins 
at the 1st April of every year, and ends at the 31st March of the next year.
This gem also extend Date class to add a ```fiscal_year``` method, working as its name.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "fiscal_year", git: "git://github.com/aprikip/fiscal_year.git"
```

And then execute:

    $ bundle

## Usage

Require no other third party gems.
```ruby
require "fiscal_year"
```
### Features
You can make a new FiscalYear object with year and fiscal year.
```ruby
FiscalYear.new(2048) # => #<FiscalYear:0x007fc22a68a0a8 @year=2048>
```
Without argument, it creates a FiscalYear object of current fiscal year.
```ruby
FiscalYear.new # => #<FiscalYear:0x007fc229cb7288 @year=2015>
```
Attributes ```year``` returns year (as a number).
```ruby
FiscalYear.new.year # => 2015
```
The #succ and #prev methods return the next and previous fiscal year.  #succ
has an alias #next.
```ruby
FiscalYear.new(2018).succ
=> #<FiscalYear:0x007fc229da8f98 @year=2019>
FiscalYear.new(2018).prev
=> #<FiscalYear:0x007fc22a6e3f40 @year=2017>
```
Addition and subtraction operators work as you expect.
```ruby
FiscalYear.new(2018)+10
# => #<FiscalYear:0x007fc22a782c08 @year=2028>
FiscalYear.new(2018)-10
# => #<FiscalYear:0x007fc22d00afb8 @year=2008>
FiscalYear.new(2018)-FiscalYear.new(2012) # => 6
```
The comparison operators also work ordinary.
```ruby
FiscalYear.new(2040)<FiscalYear.new(2046) # => true
FiscalYear.new(2040)<=FiscalYear.new(2040) # => true
FiscalYear.new(2040)>FiscalYear.new(2050) # => false
FiscalYear.new(2040)>=FiscalYear.new(2048) # => false
```
The #<=> operator works to enable making a Range.
```ruby
FiscalYear.new(2040)<=>FiscalYear.new(2046) # => -1
FiscalYear.new(2042)<=>FiscalYear.new(2030) # => 1
FiscalYear.new(2040)<=>FiscalYear.new(2040) # => 0
FiscalYear.new(2040)..FiscalYear.new(2050)
# => #<FiscalYear:0x007fc22d1224c8 @year=2040>
..
#<FiscalYear:0x007fc22d1224a0 @year=2050>
```
The #first_date and #last_date return Date object as you expect.
```ruby
FiscalYear.new(2057).first_date
# => #<Date: 2057-04-01 ((2472455j,0s,0n),+0s,2299161j)>
FiscalYear.new(2100).last_date
# => #<Date: 2101-03-31 ((2488524j,0s,0n),+0s,2299161j)>
```
The #size, alias #length, method returns the length of fiscal year in day.
```ruby
FiscalYear.new(2015).size # => 366  as it includes a leap year 2016.
FiscalYear.new(2016).size # => 365
```
The #dates method returns a Range of Date's of this fiscal year.
```ruby
FiscalYear.new(2017).dates
=> #<Date: 2017-04-01 ((2457845j,0s,0n),+0s,2299161j)>
..
#<Date: 2018-03-31 ((2458209j,0s,0n),+0s,2299161j)>
```

### Addenda
This will add #to_fiscal year method to Date class.
```ruby
Date.new(2017, 4, 27).fiscal_year
=> #<FiscalYear:0x007fc22d04b4c8 @year=2017>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aprikip/fiscal_year.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

