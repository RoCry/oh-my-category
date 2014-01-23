Pod::Spec.new do |s|
  s.name         = "oh-my-category"
  s.version      = "0.2"
  s.summary      = "For my personal Convenient"
  s.homepage     = "http://rocry.com"
  s.license      = 'No License'
  s.author       = { "RoCry" => "crysheen@gmail.com" }
  s.source       = { :git => "https://github.com/RoCry/oh-my-category.git", :tag => "0.2" }

  # Platform setup
  s.requires_arc = true

  ### Subspecs

  s.subspec 'iOS' do |ss|
    ss.source_files =  'Classes/Shared', 'Classes/iOS/**/*.{h,m,c,cpp}'
  end

  s.subspec 'Mac' do |ss|
    ss.source_files =  'Classes/Shared',  'Classes/Mac/**/*.{h,m,c,cpp}'
  end

  s.ios.frameworks = 'QuartzCore', 'CoreData', 'CoreGraphics'
  s.dependency 'NSLogger', '~> 1.1'
end
