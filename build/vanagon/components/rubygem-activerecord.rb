# frozen_string_literal: true

component 'rubygem-activerecord' do |pkg, _settings, _platform|
  pkg.version '4.2.11'
  instance_eval File.read('build/vanagon/components/_base-rubygem.rb')
end
