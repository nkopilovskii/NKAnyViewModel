#
# Be sure to run `pod lib lint NKAnyViewModel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NKAnyViewModel'
  s.version          = '0.1.0'
  s.summary          = 'A simple tool for configuring views'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This solution can be used as a stand-alone view configuration tool, or as an element of the configuration mechanism of composite visual components (for example, UITableView)
                       DESC

  s.homepage         = 'https://github.com/nkopilovskii/NKAnyViewModel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nick Kopilovskii' => 'nkopilovskii@gmail.com' }
  s.source           = { :git => 'https://github.com/nkopilovskii/NKAnyViewModel.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mkopilovskii'

  s.ios.deployment_target = '10.0'

  s.source_files = 'NKAnyViewModel/Classes/**/*'
  
end
