Pod::Spec.new do |s|
  s.name         = "oh-my-category"
  s.version      = "0.1"
  s.summary      = "For my personal Convenient"
  s.homepage     = "http://rocry.com"

  s.license      = 'MIT (example)'
  s.author       = { "RoCry" => "crysheen@gmail.com" }
  s.source       = { :git => "https://github.com/RoCry/oh-my-category.git", :tag => "0.1" }
  s.platform     = :ios, '5.0'
  s.source_files = 'Classes', 'Classes/**/*.{h,m,c,cpp}'

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  s.frameworks = 'QuartzCore', 'CoreData', 'CoreGraphics'
  s.requires_arc = true
  s.dependency 'NSLogger', '~> 1.1'
end
