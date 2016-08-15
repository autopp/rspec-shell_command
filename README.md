# rspec-command
![Build Status](https://circleci.com/gh/autopp/rspec-command.svg?style=shield&circle-token=afa2f781f5b99c17e1a41dc10439a2c94eb9c43d)

The RSpec extention for writing a behavior of external command.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-command'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-command

## Usage

```ruby
require 'rspec/command'

describe '`echo hello; echo goodbye >&2`' do
  # Enables DSL
  include RSpec::Command::DSL

  # Check whether success or fail
  it 'successes' do
    expect(`echo hello; echo goodbye >&2`).to success
  end

  # Check the status code
  it 'exit with status code 0' do
    expect(`echo hello; echo goodbye >&2`).to exit_with(0)
  end

  # Check standard output
  # (The output matcher behaves like the builtin output)
  it 'output "hello\n" to stdout' do
    expect(`echo hello; echo goodbye >&2`).to output("hello\n").to_stdout
  end

  # Check standard error
  it 'output a some string to stderr' do
    expect(`echo hello; echo goodbye >&2`).to output.to_stderr
  end
end

# Composing matcher is supported!
describe '`echo hello; echo goodbye >&2; exit 2`' do
  include RSpec::Command::DSL

  subject { `echo hello; echo goodbye >&2; exit 2` }

  # Check the status code using a composing matcher
  it { is_expected.to exit_with(a_value_between(1, 3)) }

  # Check standard output using a Regexp
  it { is_expected.to output(/ell/).to_stdout }

  # Check standard error using a composing matcher
  it { is_expected.to output(a_string_starting_with('good')).to_stderr }
end
```

NOTE: When including `RSpec::Command::DSL`, a backquote operator returns a wrapper object of given command, instead of the standard output.

If you need to use `RSpec::Command::DSL` at all examples, you can write as bellow at your `spec/spec_helper.rb`:

```ruby
require 'rspec/command'

RSpec.configure do |c|
  c.include RSpec::Command::DSL
end
```

## Author
[@AuToPP](https://twitter.com/AuToPP)

## LICENSE
[MIT](./LICENSE.txt)
