# Sometimes

Stop being so black and white. Mix things up a bit and execute code *sometimes*.

A (very) simple collection of lil' helpers polluting namespaces because...why the hell not?

## Installation

Works with only ruby 1.9.2 and up for now because I'm lazy and like the Random class.

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
sometimes do
  puts "Hey, you are awesome. You really are."  # executes warm fuzzies 50% of the time
end
```

Maybe you want to do something several times, but not always the exact same number of times

```ruby
(4..10).times do
  pick_nose  # between 4 and 10 boogers made, it's unpredictable!
end
``` 

Maybe you want to remind someone of something, but not toooo often (It gets annoying!)

```ruby
15.percent_of_the_time do
  puts "Howdy, Don't forget to register!"  # be annoying, but only 15% of the time
end

33.percent_of_the_time do
  be_very_polite
end
```

Share a rare moment with your user

```ruby
rarely do
  puts "How would you like some spammy spam spam!"  # be really annoying about 5% of the time
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
## Why?

This gem was made so [alonetone](http://github.com/sudara/alonetone) could bit more fun when displaying notices and communicating to our users. 

We are human, and have personality. Shouldn't our applications reflect this? Be predictable where it counts. But toss in some spice here and there — it is always a good thing. 
