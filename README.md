# svelte-rack

Rack middleware for compiling [Svelte components] to Javascript

  [Svelte components]: https://svelte.technology


## Usage

```
# Within a rackup file (or with Rack::Builder):
#   require 'rack/svelte'
#   use Rack::Svelte,
#     #:app_root_dir         => ::File.expand_path('..', __FILE__),
#     :app_root_dir         => Rack::Directory.new('').root,
#     :components_dir_in    => '/app/components',
#     :components_dir_out   => '/public/app/js',
#     :format               => 'iife'
#   run app
#
# Rails example:
#   # above Rails::Initializer block
#   require 'rack/svelte'
#
#   # inside Rails::Initializer block
#   config.middleware.use Rack::Svelte,
#     #:app_root_dir         => Rails.root.to_s,
#     :components_dir_in    => '/app/components',
#     :components_dir_out   => '/public/app/js',
#     :format               => 'iife'

```

## Installation

Command Line

```
gem install svelte-rack
```

Gemfile

```
gem "svelte-rack", "~>0.1"
```

## Development

### Svelte

https://svelte.technology

* svelte-rack compiles components from html markup on every request.
* svelte-rack relies on the power of the [svelte-ruby gem] and defaults to settings based on convention. However, you can override these through configuration.
* svelte-rack will assume the root dir is the expand path from the `./` dir relative to config.ru location.

  [svelte-ruby gem]: https://github.com/bordeeinc/svelte-ruby


### Dev Requirements

* [hoe](https://github.com/seattlerb/hoe) gem manager
* [hoe-bundler] may need `gem install hoe-bundler` installation before using `rake bundler:gemfile`
* [YARD](http://yardoc.org) docs
* [redcarpet](https://github.com/vmg/redcarpet) for yardoc

   [hoe-bundler]: https://github.com/flavorjones/hoe-bundler

### Testing

Tests written with [minitest]

```
rake test
```

  [minitest]: https://github.com/seattlerb/minitest

### Contributing

Send tested code.
Thank you, [contributors]!

  [contributors]: https://github.com/bordeeinc/svelte-rack/graphs/contributors

### To Do

* More tests
* More docs

## License

MIT License

Copyright (c) 2017 Bordee Inc.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## About

![bordee](http://bordee.com/src/img/surf-with-bordee-github.png)

svelte-rack is maintained and funded by Bordee Inc.
The names and logos for Bordee are trademarks of [Bordee Inc.][bordeeinc]

  [bordeeinc]: http://bordee.com

Thanks to [Phil Misiowiec] and [Robert Bialek] of [Tidy gem]--Tidy was used as boilerplate.

  [Tidy gem]: https://github.com/rbialek/rack-tidy
  [Phil Misiowiec]: https://github.com/philm
  [Robert Bialek]: https://github.com/rbialek

We love open source software!
See [our other projects][bordee-github]
and [check out Seattle.rb!][community]

  [bordee-github]: https://github.com/bordeeinc
  [community]: https://seattlerb.org
