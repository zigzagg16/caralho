Pod::Spec.new do |s|
  s.name         = "caralho"
  s.version      = "0.1"
  s.summary      = "A simple text animation using UITableView"
  s.description  = "Display some fancy text animations, line by line, using UITableView. Easily customisable !"
  s.homepage     = "https://github.com/arn00s/caralho"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Arnaud Schloune" => "arnaud.schloune@gmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/arn00s/caralho.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
