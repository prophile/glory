#!/usr/bin/env ruby

require "erb"
require "yaml"
require "json"
require "open-uri"

begin
  file = File.read('settings.yaml')
  settings = YAML::load(file)

  def read_uri(uri)
    open(uri) do |f|
      f.read
    end
  end

  erb = ERB.new File.read('scripts/skeleton-site.erb')
  File.open('manifests/base.pp', 'w') do |handle|
    handle.write erb.result
  end
rescue Errno::ENOENT
  puts "No settings.yaml file found."
  exit 1
end

