# Sometimes

[![Build Status](https://github.com/sudara/sometimes/workflows/rubyCI/badge.svg
)](https://github.com/sudara/sometimes/actions)

Stop being so black and white. Mix things up a bit and execute code *sometimes*.

A (very) simple collection of lil' helpers polluting Object namespaces since 2013 because...why the hell not?

## Installation

Add this line to your Gemfile:

```ruby
gem 'sometimes'
```

And then execute:

```console
$ bundle
```

Require when needed

```ruby
require 'sometimes'
```

## Usage

Say something every other time

```ruby
# executes warm fuzzies 50% of the time
sometimes do
  puts "Hey, you are awesome. You really are."
end
```


Maybe you want to do something several times, but not always the exact same number of times

```ruby
# between 4 and 10 boogers made, it's unpredictable!
(4..10).times do
  pick_nose
end
```


Maybe you want to remind someone of something, but not toooo often (It gets annoying!)

```ruby
# be annoying, but only 15% of the time
15.percent_of_the_time do
  puts "Howdy, Don't forget to register!"
end

33.percent_of_the_time do
  be_very_polite
end
```

Share a rare moment with your user

```ruby
# be really annoying about 5% of the time
rarely do
  puts "How would you like some spammy spam spam!"
end

1.percent_of_the_time do
  puts "Want to see something really cool?"
end
```

If you can't say something nice, don't say anything at all:

```ruby
never do
  puts "You're a terrible person"
end
```

Always remember your manners:

```ruby
always do
  puts "Thanks for sharing!"
end
```

### Otherwise

Counting precisely is overrated.

```ruby
# Sometimes increment, sometimes don't
i += sometimes(1)

# 5% of the time add 10, otherwise increment
i += rarely(10, otherwise:1)
```

Model real life state, like your calendar
```ruby
# 95% of the time you are in meetings
status = mostly ? "busy" : "free"

# same as above
status = mostly("busy", otherwise: "free")

```

## Why?

This gem was made so [alonetone](http://github.com/sudara/alonetone) could bit more fun when displaying notices and communicating to our users.

We are human, and have personality. Shouldn't our applications reflect this? Be predictable where it counts. But toss in some spice here and there — it is always a good thing.


## Versions

Works with ruby 2.7 and higher.

Use version 1.0.0 to support ruby < 2.7
Use version 0.0.2 to support ruby < 2.2

## Updating and Releasing this gem

* Update lib/sometimes/version.rb

```
bundle && bundle exec rake gemspec
bundle exec rake release
```
