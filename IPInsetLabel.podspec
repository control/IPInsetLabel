#
# Be sure to run `pod lib lint IPInsetLabel.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "IPInsetLabel"
  s.version          = "1.1.0"
  s.summary          = "A simple UILabel subclass that adds padding insets and auto-height-resizing"
  s.description      = <<-DESC
                      IPInsetLabel is a simple UILabel subclass that adds padding insets and
                      auto-height-resizing.  Originally a gist, now packaged into a Cocoapod to stay
                      updated.
                       DESC
  s.homepage         = "https://github.com/doublerebel/IPInsetLabel"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'Public Domain'
  s.author           = { "Charles Phillips" => "charles@doublerebel.com" }
  s.source           = { :git => "https://github.com/doublerebel/IPInsetLabel.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/doublerebel'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'IPInsetLabel' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
