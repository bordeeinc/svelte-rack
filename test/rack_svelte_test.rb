require 'test_helper'

describe "Rack::Svelte" do  
  before do
    @test_root                = File.expand_path(File.dirname(__FILE__))
    @test_app_root            = File.join(@test_root, "test_app")
    @test_app_template        = File.join(@test_root, "test_app_template")
    @files                    = File.join(@test_root, "files")

    @hello_world_filename     = File.join(@files, 'hello_world.html')
    @hello_world_output       = IO.read(File.join(@files, 'hello_world_output.txt'))
    @hello_world_output_iife  = IO.read(File.join(@files, 'hello_world_output_iife.txt'))

    @hello_world_test_html    = File.join(@test_app_root, Rack::Svelte::Cogs::DEFAULT_COMPONENTS_IN, 'hello_world.html')
    @hello_world_test_js      = File.join(@test_app_root, Rack::Svelte::Cogs::DEFAULT_COMPONENTS_OUT, 'hello_world.js')

    FileUtils.rm_rf @test_app_root
    FileUtils.cp_r  @test_app_template, @test_app_root

    @options = {
      app_root_dir: @test_app_root
    }
  end

  describe "with content type equal to 'text/html'" do
    it "should compile" do
      assert File.exist?(@hello_world_test_html)
      refute File.exist?(@hello_world_test_js)

      get_response('/', '<!--BODY-->', 'text/html', @options)
      assert File.exist? @hello_world_test_js

      exp = @hello_world_output
      act = IO.read(@hello_world_test_js)
      assert_equal exp, act
    end

    it "should compile with iife" do
      assert File.exist?(@hello_world_test_html)
      refute File.exist?(@hello_world_test_js)

      get_response('/', '<!--BODY-->', 'text/html', @options.merge(format: 'iife'))
      assert File.exist? @hello_world_test_js

      exp = @hello_world_output_iife
      act = IO.read(@hello_world_test_js)
      assert_equal exp, act
    end
  end

  after do
    FileUtils.rm_rf @test_app_root
  end
end
