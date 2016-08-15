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

describe 'echo hello; echo goodby >&2' do
  # Enables DSL
  include RSpec::Command::DSL

  # Check whether success or fail
  it 'successes' do
    expect(`echo hello; echo goodby >&2`).to success
  end

  # Check the status code
  it 'exit with status code 0' do
    expect(`echo hello; echo goodby >&2`).to exit_with(0)
  end

  # Check the output of the standard output
  # (A output matcher behaves like the builtin output)
  it 'output "hello\n" to stdout' do
    expect(`echo hello; echo goodby >&2`).to output("hello\n").to_stdout
  end

  # Check the output of the standard error by Regexp
  it 'output "goodby\n" to stderr' do
    expect(`echo hello; echo goodby >&2`).to output(/^good/).to_stderr
  end
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
