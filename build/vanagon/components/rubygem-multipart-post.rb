component 'rubygem-multipart-post' do |pkg, settings, platform|
  pkg.version '2.1.1'
  instance_eval File.read('build/vanagon/components/_base-rubygem.rb')
end
