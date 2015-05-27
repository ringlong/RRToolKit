#
#  Be sure to run `pod spec lint RRToolKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "RRToolKit"
  s.version      = "0.0.1"
  s.summary      = "A ToolKit of iOS development."
  s.homepage     = "http://EXAMPLE/RRToolKit"
  s.license      = "MIT (example)"
  s.author             = { "Ryan" => "266949@qq.com" }

  s.platform     = :ios, "6.0"
  s.ios.deployment_target = "6.0"

  s.source       = { :git => "http://EXAMPLE/RRToolKit.git", :tag => "0.0.1" }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.public_header_files = "Classes/**/*.h"
  s.frameworks = "CoreGraphics"
  s.requires_arc = true
  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
