# frozen_string_literal: true

component 'rubygem-minitest' do |pkg, _settings, _platform|
  pkg.version '5.14.0'
  instance_eval File.read('build/vanagon/components/_base-rubygem.rb')
end
