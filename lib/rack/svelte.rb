require 'rack'
require 'svelte'
require 'FileUtils' unless Object.const_defined?('FileUtils')

# Svelte for Rack w/ Cogs
#
# Within a rackup file (or with Rack::Builder):
#   require 'rack/svelte'
#   use Rack::Svelte,
#     #:app_root_dir         => ::File.expand_path('..', __FILE__),
#     #:app_root_dir         => Rack::Directory.new('').root,
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
#     :app_root_dir         => Rails.root.to_s,
#     :components_dir_in    => '/app/components',
#     :components_dir_out   => '/public/app/js',
#     :format               => 'iife'
module Rack::Svelte
  autoload :Cogs, 'rack/svelte/cogs'

  # Create a new Rack::Svelte middleware component that builds Svelte components
  # using the svelte-ruby gem. The +options+ Hash can include any Svelte compiler
  # options AND components_dir_in, components_dir_in
  # @see Svelte on Github for options: https://github.com/sveltejs/svelte#options
  def self.new(backend, options = {})
    Cogs.new(backend, options)
  end
end
