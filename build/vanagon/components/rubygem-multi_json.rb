# frozen_string_literal: true

component 'rubygem-multi_json' do |pkg, _settings, _platform|
  pkg.version '1.15.0'
  instance_eval File.read('build/vanagon/components/_base-rubygem.rb')
end
