# frozen_string_literal: true

component 'rubygem-rack-console' do |pkg, _settings, _platform|
  pkg.version '1.3.1'
  instance_eval File.read('build/vanagon/components/_base-rubygem.rb')
end
