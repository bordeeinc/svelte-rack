gem "minitest"
require 'minitest/spec'
require "minitest/autorun"
require "rack/svelte"
require 'rack/mock'
#require 'FileUtils' unless Object.const_defined?('FileUtils')

def get_response(path, body, content_type = 'text/html', options = {})
  app = Rack::Builder.new do
    use Rack::Svelte, options
    run lambda {|env| [200, {'Content-Type' => content_type}, [body]]}
  end

  Rack::MockRequest.new(app).get(path)
end
