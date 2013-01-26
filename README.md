# Sometimes

Stop being so black and white. Mix things up a bit and start doing things *sometimes*.

A simple (very) collection of lil' ruby helpers polluting namespaces because why the hell not?

## Installation

Add this line to your application's Gemfile:

    gem 'sometimes'

And then execute:

    $ bundle

And then require when needed

    require 'sometimes'

## Usage

This gem is partly to make [alonetone](http://alonetone.com) more fun. But also because I believe in UIs being fun, having personality, etc. Apps should be predictable where it counts. But come on, adding some spice here and there is always a good thing. 

So, maybe you want to say something sometimes.

    sometimes do
      puts "hey, you feeling good? Good." # executes 50% of the time
    end

Maybe you want to do something several times, but mix things up a bit.

    (4..10).times do
      pick_nose # executes between 4 and 10 times
    end

Maybe you want to remind someone, but not toooo often (It gets annoying!)

    15.percent_of_the_time do
      puts "Howdy, Don't forget to register!" # executes about 15% of the time
    end

Or just rarely

    rarely do
      puts "Here's some spammy spam spam!" # executes about 5% of the time
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
