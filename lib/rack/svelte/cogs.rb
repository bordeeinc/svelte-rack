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
    SVELTE_RACK_ATTRS         = [:app_root_dir, :components_dir_in, :components_dir_out, :dir_out_overwrite, :dir_out_clear]

    def initialize(app, options = {})
      @app                      = app
      symbolize_keys!(options)
      @app_root_dir         = options.fetch(:app_root_dir,        DEFAULT_ROOT)
      @components_dir_in    = options.fetch(:components_dir_in,   DEFAULT_COMPONENTS_IN)
      @components_dir_out   = options.fetch(:components_dir_out,  DEFAULT_COMPONENTS_OUT)
      @dir_out_overwrite    = options.fetch(:dir_out_overwrite,   DEFAULT_DIR_OUT_OVERWRITE)
      @dir_out_clear        = options.fetch(:dir_out_clear,       DEFAULT_DIR_OUT_CLEAR)
      @svelte_options       = DEFAULT_SVELTE_OPTS.merge(options.reject {|x| SVELTE_RACK_ATTRS.include?(x)})
    end

    def call(env)
      dir_in  = File.join(@app_root_dir, @components_dir_in)
      dir_out = File.join(@app_root_dir, @components_dir_out)

      raise "ERROR: Dir In cannot be found: #{dir_in}" unless Dir.exist? dir_in
      raise "ERROR: Dir Out cannot be found: #{dir_out}" unless Dir.exist? dir_out

      FileUtils.rm_rf(Dir.glob(File.join(dir_out, '*'))) if @dir_out_clear

      Dir.glob(File.join(dir_in, '**/*')).each do |filename_in|
        # only html components
        next unless filename_in =~ /.\.html$/i

        # create output filename
        fn_in               = filename_in[dir_in.length..-1]  # remove input dir
        fn_out_basename     = File.basename(fn_in, '.html')
        fn_out_basename_js  = File.basename(fn_in, '.html') + '.js'
        fn_out_dir          = File.dirname(fn_in)
        fn_out              = File.join(dir_out, fn_out_dir, fn_out_basename + '.js') # Kenny Powers

        # ensure output dir
        FileUtils.mkdir_p(fn_out_dir) unless Dir.exist?(fn_out_dir)

        # compile
        comp_opts = @svelte_options.dup
        comp_opts.merge!(name: fn_out_basename) unless comp_opts.key?(:name)
        sv_hash = ::Svelte.exec_method('svelte.compile', filename_in, nil, comp_opts)

        unless @dir_out_overwrite
          raise "Error: file exists: #{fn_out}\n  use option: 'dir_out_overwrite: true'" if File.exist?(fn_out)
        end

        # write
        IO.write(fn_out, sv_hash['code'])
      end

      @app.call(env)
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
