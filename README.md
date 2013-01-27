# Sometimes

Stop being so black and white. Mix things up a bit and execute code *sometimes*.

A (very) simple collection of lil' helpers polluting namespaces because...why the hell not?

## Installation

Add this line to your Gemfile:

    gem 'sometimes'

And then execute:

    $ bundle

Require when needed

    require 'sometimes'

## Usage

Say something every other time

    sometimes do
      puts "Hey, you are awesome. You really are."  # executes warm fuzzies 50% of the time
    end

Maybe you want to do something several times, but not always the exact same number of times

    (4..10).times do
      pick_nose  # between 4 and 10 boogers made, it's unpredictable!
    end

Maybe you want to remind someone of something, but not toooo often (It gets annoying!)

    15.percent_of_the_time do
      puts "Howdy, Don't forget to register!"  # be annoying, but only 15% of the time
    end

Or maybe there's a rare task that should pop up once and a while

    rarely do
      puts "How would you like some spammy spam spam!"  # be really annoying about 5% of the time
    end

## Why?

This gem was made so [alonetone](http://github.com/sudara/alonetone) could bit more fun when displaying notices and communicating to our users. 

We are human, and have personality. Shouldn't our applications reflect this? Be predictable where it counts. But lets add some spice here and there — it is always a good thing. 