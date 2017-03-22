require 'svelte' unless Object.const_defined?('Svelte')
require 'FileUtils' unless Object.const_defined?('FileUtils')

module Rack::Svelte
  # This class is the interface between Rack and the svelte-ruby gem
  class Cogs

    # defaults for the Svelte gem config
    DEFAULT_SVELTE_OPTS       = {}
    DEFAULT_ROOT              = '/'
    DEFAULT_COMPONENTS_IN     = '/app/components'
    DEFAULT_COMPONENTS_OUT    = '/public/app/js'
    DEFAULT_DIR_OUT_OVERWRITE = false
    DEFAULT_DIR_OUT_CLEAR     = false

    # svelte-ruby gem options, see https://github.com/sveltejs/svelte#options
    attr_accessor :svelte_options

    # options for Rack::Svelte processing
    attr_accessor :app_root_dir
    attr_accessor :components_dir_in
    attr_accessor :components_dir_out
    attr_accessor :dir_out_overwrite
    attr_accessor :dir_out_clear

    def initialize(app, options = {})
      @app                      = app
      symbolize_keys!(options)
      self.app_root_dir         = options.delete(:app_root_dir)       || DEFAULT_ROOT
      self.components_dir_in    = options.delete(:components_dir_in)  || DEFAULT_COMPONENTS_IN
      self.components_dir_out   = options.delete(:components_dir_out) || DEFAULT_COMPONENTS_OUT
      self.dir_out_overwrite    = options.delete(:dir_out_overwrite)  || DEFAULT_DIR_OUT_OVERWRITE
      self.dir_out_clear        = options.delete(:dir_out_clear)      || DEFAULT_DIR_OUT_CLEAR
      self.svelte_options       = DEFAULT_SVELTE_OPTS.merge(options)
    end

    # method required by Rack interface
    def call(env)
      call! env
    end

    # thread safe version using shallow copy of env
    def call!(env)
      dir_in  = File.join(self.app_root_dir, self.components_dir_in)
      dir_out = File.join(self.app_root_dir, self.components_dir_out)

      raise "ERROR: Dir In cannot be found: #{dir_in}" unless Dir.exist? dir_in
      raise "ERROR: Dir Out cannot be found: #{dir_out}" unless Dir.exist? dir_out

      FileUtils.rm File.join(dir_out, '*') if self.dir_out_clear

      Dir.glob(File.join(dir_in, '**/*')).each do |filename_in|
        # only html components
        next unless filename_in =~ /.\.html$/i

        # create output filename
        fn_in           = filename_in[dir_in.length..-1]  # remove input dir
        fn_out_basename = File.basename(fn_in).split('.')[0] + '.js'
        fn_out_dir      = File.dirname(fn_in)
        fn_out          = File.join(dir_out, fn_out_dir, fn_out_basename) # Kenny Powers

        # ensure output dir
        FileUtils.mkdir_p(fn_out_dir) unless Dir.exist?(fn_out_dir)

        # compile
        sv_hash = ::Svelte.exec_method('svelte.compile', filename_in, *self.svelte_options)

        unless self.dir_out_overwrite
          raise "Error: file exists: #{fn_out}\n  use option: 'dir_out_overwrite: true'" if File.exist?(fn_out)
        end

        # write
        IO.write(fn_out, sv_hash['code'])
      end

      ##
      # TODO: research thread safety (the following is adopted)
      @env = env.dup
      @app.call(@env)
    end

    private

    def symbolize_keys(arg_hash)
      arg_hash.each_with_object({}) {|(k,v),h| h[k.to_sym] = v}
    end

    def symbolize_keys!(arg_hash)
      arg_hash = symbolize_keys(arg_hash)
    end

  end
end
