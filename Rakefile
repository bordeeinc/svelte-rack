# -*- ruby -*-

require "rubygems"
require "hoe"
require './lib/rack/svelte/version.rb'

Hoe.plugin :gemspec
Hoe.plugin :minitest
Hoe.plugin :yard
Hoe.plugin :bundler
Hoe.plugin :git
Hoe.plugin :ignore

Hoe.spec "svelte-rack" do
  developer("So Awesome Man", "callme@1800aweso.me")

  license "MIT" # this should match the license in the README

  self.email                = 'support@bordee.com'

  self.name                 = 'svelte-rack'
  self.version              = Rack::Svelte::VERSION
  self.summary              = 'Rack middleware to render Svelte components to Javascript'
  self.description          = self.summary
  self.urls                 = ['https://github.com/bordeeinc/svelte-rack']
  self.testlib              = :minitest
  self.readme_file          = 'README.md'
  self.history_file         = 'History.txt'

  # third-party
  self.yard_title           = self.name
  self.yard_markup          = 'markdown'

  self.extra_deps += [
    ['svelte-ruby',               '~> 0.1'],
    ['rack',                      '~> 2.0']
  ]

  self.extra_dev_deps += [
    ["hoe-yard",                  "~> 0.1"],
    ["hoe-ignore",                "~> 1.0"],
    ["hoe-bundler",               "~> 1.2"],
    ["hoe-gemspec",               "~> 1.0"],
    ["hoe-git",                   "~> 1.6"],
    ["minitest",                  "~> 5.9"],
    ["yard",                      "~> 0.8"],
    ["redcarpet",                 "~> 3.3"] # yard/markdown
  ]

  self.clean_globs += [
    '.yardoc',
    'vendor',
    'Gemfile.lock',
    '.bundle',
  ]

  self.spec_extras = {
    # Rack 2.0 require Ruby 2.2.2
    :required_ruby_version => '>= 2.2.2'
  }
end

# require rake tasks
#current_dir = File.expand_path(File.dirname(__FILE__))
#Dir.glob(File.join(current_dir, 'lib/rack/svelte/tasks/*.rake')).each {|r| import r} 
