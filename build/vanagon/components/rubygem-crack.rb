component 'rubygem-crack' do |pkg, settings, platform|
  pkg.version '0.4.3'
  instance_eval File.read('build/vanagon/components/_base-rubygem.rb')
end
