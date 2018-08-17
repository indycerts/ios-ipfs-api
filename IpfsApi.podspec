#
# Be sure to run `pod lib lint IpfsApi.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IpfsApi'
  s.version          = '0.1.0'
  s.summary          = 'A wrapper of the IPFS Client HTTP-API for iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A wrapper of the IPFS Client HTTP-API for iOS.
                       DESC

  s.homepage         = 'https://github.com/kjaylee/ios-ipfs-api'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kjaylee' => 'k.jaylee@gmail.com' }
  s.source           = { :git => 'https://github.com/kjaylee/ios-ipfs-api.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kjaylee'

  s.ios.deployment_target = '8.0'

  s.source_files = 'IpfsApi/Classes/*.swift'
  
  # s.resource_bundles = {
  #   'IpfsApi' => ['IpfsApi/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Moya', '~> 11.0'
end
