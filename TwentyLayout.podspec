Pod::Spec.new do |s|
  s.name         = "TwentyLayout"
  s.version      = "0.1"
  s.summary      = "The safest, yet most powerful, Auto Layout DSL you deserve in 2020"
  s.description  = <<-DESC
    The safest, yet most powerful, Auto Layout DSL you deserve in 2020
  DESC
  s.homepage     = "https://github.com/jegnux/TwentyLayout"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jérôme Alves" => "j.alves@me.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/jegnux/TwentyLayout.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.exclude_files = 'Sources/**/*_Tests*'
  s.frameworks  = "Foundation"
end
