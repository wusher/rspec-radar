# rspec-radar

`rspec-radar` monkey patches `rspec-mocks` to prevent the stubbing of methods that don't exist. If you try and stub a method that doesn't exist, an `UndefinedMethodError` will be raised. 

## Usage

Step 1. Add the gem to your gemfile.

```ruby
  # Gemfile
  gem 'rspec-radar'
```

Step 2. In the `spec_helper.rb` file, require 'rspec/radar'
``` ruby
  # spec_helper.rb
  require 'rspec/radar'
```

Now if you call `stub` or `should_receive` on a class or variable, it will check to see if the method exists and raise an exception if it doesn't. 

## How it works

`rspec-radar` monkey patches `rspec-mocks` and will raise an excpetion if you stub a method that doesn't exist. Spefically it alters the method `visibility` in the class `MethodDouble`. 

## Motivations 

I want to be able to prevent the stubbing of nonexistent methods when using rspec. Currently there is no way to do this with [rspec-mocks](https://github.com/rspec/rspec-mocks). There is a popular mocking alternative called [rspec-fire](https://github.com/xaviershay/rspec-fire); however, rspec-fire isn't what I am after. rspec-fire introduces a different stubbing syntax and doesn't guard against a stub on an instance variable.

## Contributing

I'm more that happy to accept pull-requests.  Also, I'm more than happy to receive crticism/suggestions for a better way to make this work.

```ruby
git clone https://github.com/wusher/rspec-radar.git
bundle install
bundle exec rake spec
```

## Future Plans

The following are features in want to add. _(not in any spefic order)_

* make it work when stubbing an entire class ( i.e. `stub(Avocado, fake_method: "boom") # raises undefined method error`)
* make it work with `any_instance` ( i.e. `Avocado.any_instance.stub(:fake_method) # raises undefined method error)`
* make the existance checks a configuration option
* setup `stub!` so it will skip the existance check`
