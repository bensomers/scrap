Scrap is a Rack endpoint designed to expose various garbage and memory-related metrics about your app. It may be particularly useful in tracking down memory leaks or bloated actions.

For use in Rails apps: just add it to your Gemfile (if you're using bundler, which you probably are). Scrap includes a railtie that will automatically activate it.
For use in Rack apps: install the gem, require 'scrap', and run Scrap as a middleware.

Scrap will provide a new url, <code>/stats/scrap</code>, which will report a number of metrics about your app.

For an example of the output, see sample.html (taken from a very large
Rails app).

## Usage

If you're running scrap in a Rails app, just add it to your Gemfile (or
install it and require it, if you're not using Bundler). Scrap comes
with a Rails::Engine that will automatically require the middleware and
add its route.

If you're not using Rails, then you'll have to add Scrap::Middleware to
your middleware stack.

Scrap is not recommended for long-term production usage, as it does
incur a significant (though not crippling) performance penalty.
Typically, you would install it for a few days at a time when you
suspect you have a memory problem and want to hunt it down, then remove
Scrap once you're done debugging.

## Dependencies

None, really, though Scrap is intended for Linux systems. On OS
X, the Ruby GC statistics will be displayed, but overall process memory
usage will not be reported. Scrap has been tested extensively with Ruby 1.9 on Rails 3.0.x, and 
less so on 3.1.x and 3.2.x. Reports of Scrap's usefulness in other
configurations are welcome.

## Config

If present, Scrap will use a config/scrap.yml file. See the provided example file for a list of the configuration options accepted.

* max requests: How many requests to keep a record of. Older requests will be pushed out of the queue when the limit has been reached. Default is 150.
* max_objects: How many objects/deltas to show. Default is 50.
* classes: A hash of class names to do object counting on. Values may be "true" which prints the object count with a default set of options, or it may be a hash consisting of the following:
  * print_objects: boolean - toggles the output of a representation of each instance of the type.
  * show_fields: array - list of fields to show per instance. This actually invokes the "attributes" method of the object, so it's really only useful for ActiveRecord objects.
  * small: boolean - if false, will not print counts in h3 tags. Default is true.
  * min: integer - minimum count, if set, that an object must have to appear in the delta or top objects list. Default is nil.
  
## Other considerations

Scrap was originally written for Ruby 1.8.7, with lots of switches to
enable it to take advantage of REE's better GC statistics visibility.
I've rewritten the switches to allow Scrap to use 1.9.3's statistics,
though they're harder to understand than REE's. Scrap should still work
well with REE, and less well (but as well as possible) on MRI 1.8.7.

## Contributing

Just message me! I am very happy working with more contributors,
accepting pull requests, etc. I'm very open to bug reports or feature suggestions.

## Acknowledgements

Lots of praise goes to [Chris Heald](https://github.com/cheald/) for writing the original plugin, and [Bradley Harris](https://github.com/bradley178/scrap) for making some improvements to enable Rails 3 compatibility.
