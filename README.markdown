Scrap is a Rack endpoint designed to expose various garbage and memory-related metrics about your app. It may be particularly useful in tracking down memory leaks.

To use it, simply install the plugin and configure as Middleware in your application.rb ("config.middleware.use 'Scrap'").  This will provide a new url, <code>/stats/scrap</code>, which will report a number of metrics about your app.

For an example of the output, see [TBD].

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
though they're harder to understand than REE's.

## Acknowledgements

Lots of praise goes to [Chris Heald](https://github.com/cheald/) for writing the original plugin, and [Bradley Harris](https://github.com/bradley178/scrap) for making some improvements to enable Rails 3 compatibility.
