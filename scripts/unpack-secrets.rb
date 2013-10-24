#!/usr/bin/env ruby

require "erb"
require "yaml"

file = File.read('settings.yaml')
settings = YAML::load(file)

erb = ERB.new File.read('scripts/skeleton-site.erb')
File.open('manifests/base.pp', 'w') do |handle|
  handle.write erb.result
end

