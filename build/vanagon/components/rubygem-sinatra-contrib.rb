# frozen_string_literal: true

component 'rubygem-sinatra-contrib' do |pkg, _settings, _platform|
  pkg.version '2.0.8.1'
  instance_eval File.read('build/vanagon/components/_base-rubygem.rb')
end
