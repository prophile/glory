#!/usr/bin/env ruby

require "erb"
require "yaml"

begin
  file = File.read('settings.yaml')
  settings = YAML::load(file)

  erb = ERB.new File.read('scripts/skeleton-site.erb')
  File.open('manifests/base.pp', 'w') do |handle|
    handle.write erb.result
  end
rescue Errno::ENOENT
  puts "No settings.yaml file found."
  exit 1
end

