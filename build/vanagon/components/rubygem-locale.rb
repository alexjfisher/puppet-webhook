component 'rubygem-locale' do |pkg, settings, platform|
  pkg.version '2.1.3'
  instance_eval File.read('build/vanagon/components/_base-rubygem.rb')
end
