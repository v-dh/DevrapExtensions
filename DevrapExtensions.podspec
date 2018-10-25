#  Be sure to run `pod spec lint DevrapExtensions.podspec --allow-warnings' to ensure this is a
Pod::Spec.new do |s|
  s.name         = "DevrapExtensions"
  s.version      = "0.0.1"
  s.summary      = "DevrapExtensions."
  s.description  = <<-DESC Computes the meaning of life. Features: 1. Is self aware ... 42. Likes candies. DESC
  s.homepage     = "http://DevrapExtensions.com"
  s.license      = "MIT"
  s.author             = { "v_dh" => "vincent.dhalluin@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'
  s.source       = { :git => "git@github.com:v-dh/DevrapExtensions.git" }
  s.source_files  = "Sources/", "Sources/"
end
