#
# Be sure to run `pod lib lint ARouter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ARouter'
  s.version          = '0.1.4'
  s.summary          = 'ARouter'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  ARouter make it posibile that app counld be controlled by server.
                       DESC

  s.homepage         = 'http://git.oschina.net/abyssroger/ARouter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'RogerAbyss' => 'roger_ren@qq.com' }
  s.source           = { :git => 'https://github.com/RogerAbyss/ARouter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.frameworks = 'UIKit', 'Foundation'

  s.subspec 'Core' do |core|
    core.source_files = 'ARouter/Classes/Core/*','ARouter/Classes/ARouter.h'
    core.public_header_files = 'ARouter/Classes/Core/*.h','ARouter/Classes/ARouter.h'
  end

  s.subspec 'Json' do |json|
    json.source_files = 'ARouter/Classes/JSONKit/*'
    json.public_header_files = 'ARouter/Classes/JSONKit/*.h'

    json.requires_arc = false
  end

  s.default_subspec = 'Core','Json'
end
