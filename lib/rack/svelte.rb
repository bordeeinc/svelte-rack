require 'rack'
require 'svelte'
require 'FileUtils' unless Object.const_defined?('FileUtils')

# Svelte for Rack w/ Cogs(tm)
#
# @example Within a rackup file (or with Rack::Builder)
#   require 'rack/svelte'
#   use Rack::Svelte,
#     #app_root_dir:              Rack::Directory.new('').root,
#     app_root_dir:               ::File.expand_path(File.dirname(__FILE__)),
#     components_dir_in:          '/app/components',
#     components_dir_out:         '/public/app/js',
#     default_dir_out_overwrite:  false,
#     default_dir_out_clear:      false,
#     format:                     'iife'
#   run app
#
# @example Rails example
#   # above Rails::Initializer block
#   require 'rack/svelte'
#
#   # inside Rails::Initializer block
#   config.middleware.use Rack::Svelte,
#     app_root_dir:               Rails.root.to_s,
#     components_dir_in:          '/app/components',
#     components_dir_out:         '/public/app/js',
#     default_dir_out_overwrite:  false,
#     default_dir_out_clear:      false,
#     format:                     'iife'
#
module Rack::Svelte
  autoload :Cogs, 'rack/svelte/cogs'

  # Create a new Rack::Svelte middleware component that builds Svelte components
  #   using the svelte-ruby gem. The +options+ Hash can include any Svelte compiler
  #   options AND components_dir_in, components_dir_in
  #
  # @see Svelte on Github for options: https://github.com/sveltejs/svelte#options
  #
  # @param  backend [#rack_object] set implicitly by Rack, use the var: `backend`
  # @param          [Hash]    options for processing and svelte compiler
  # @option options [String]  :app_root_dir        app's root dir (path expanded)
  # @option options [String]  :components_dir_in   where svelte-rack look for components (path begins at app's root dir)
  # @option options [String]  :components_dir_out  where svelte-rack writes compiled js (path begins at app's root dir)
  # @option options [Boolean] :dir_out_overwrite   overwrite any files with matching name in the components_dir_out dir
  # @option options [Boolean] :dir_out_clear       clear entire components_dir_out dir before writing new files 
  # @return [void]
  #
  # Default svelte-rack options are:
  #   default_root:               '/'
  #   default_components_in:      '/app/components'
  #   default_components_out:     '/public/app/js'
  #   default_dir_out_overwrite:  false
  #   default_dir_out_clear:      false
  # 
  def self.new(backend, options = {})
    Cogs.new(backend, options)
  end
end
