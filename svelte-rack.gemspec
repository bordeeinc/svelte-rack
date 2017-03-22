# -*- encoding: utf-8 -*-
# stub: svelte-rack 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "svelte-rack".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["So Awesome Man".freeze]
  s.date = "2017-03-22"
  s.description = "Rack middleware to render Svelte components to Javascript".freeze
  s.email = "support@bordee.com".freeze
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.md".freeze, "History.txt".freeze]
  s.files = [".autotest".freeze, ".gitignore".freeze, ".hoeignore".freeze, "Gemfile".freeze, "History.txt".freeze, "LICENSE".freeze, "Manifest.txt".freeze, "README.md".freeze, "Rakefile".freeze, "lib/rack/svelte.rb".freeze, "lib/rack/svelte/cogs.rb".freeze, "lib/rack/svelte/version.rb".freeze, "test/files/hello_world.html".freeze, "test/files/hello_world_output.txt".freeze, "test/files/hello_world_output_iife.txt".freeze, "test/rack_svelte_test.rb".freeze, "test/test_app_template/app/components/hello_world.html".freeze, "test/test_app_template/public/app/js/.keep".freeze, "test/test_helper.rb".freeze]
  s.homepage = "https://github.com/bordeeinc/svelte-rack".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--title".freeze, "svelte-rack".freeze, "--markup".freeze, "markdown".freeze, "--quiet".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.2".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Rack middleware to render Svelte components to Javascript".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.10"])
      s.add_development_dependency(%q<hoe-yard>.freeze, [">= 0.1.3"])
      s.add_development_dependency(%q<hoe-ignore>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-bundler>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<hoe-gemspec>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-git>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<redcarpet>.freeze, ["~> 3.3"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.16"])
    else
      s.add_dependency(%q<minitest>.freeze, ["~> 5.10"])
      s.add_dependency(%q<hoe-yard>.freeze, [">= 0.1.3"])
      s.add_dependency(%q<hoe-ignore>.freeze, ["~> 1.0"])
      s.add_dependency(%q<hoe-bundler>.freeze, ["~> 1.2"])
      s.add_dependency(%q<hoe-gemspec>.freeze, ["~> 1.0"])
      s.add_dependency(%q<hoe-git>.freeze, ["~> 1.6"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_dependency(%q<redcarpet>.freeze, ["~> 3.3"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.16"])
    end
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.10"])
    s.add_dependency(%q<hoe-yard>.freeze, [">= 0.1.3"])
    s.add_dependency(%q<hoe-ignore>.freeze, ["~> 1.0"])
    s.add_dependency(%q<hoe-bundler>.freeze, ["~> 1.2"])
    s.add_dependency(%q<hoe-gemspec>.freeze, ["~> 1.0"])
    s.add_dependency(%q<hoe-git>.freeze, ["~> 1.6"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_dependency(%q<redcarpet>.freeze, ["~> 3.3"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.16"])
  end
end
