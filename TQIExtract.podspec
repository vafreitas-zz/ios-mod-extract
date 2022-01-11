#
# Be sure to run `pod lib lint TQIExtract.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TQIExtract'
  s.version          = '1.0.0'
  s.summary          = 'TqiBank Extract Module'

  s.homepage         = 'https://github.com/vafreitas/ios-mod-extract'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vafreitas' => 'vitoralves59@gmail.com' }
  s.source           = { :git => 'https://github.com/vafreitas/ios-mod-extract.git', :tag => s.version.to_s }
  
  s.static_framework = true
  s.platform      = :ios
  s.swift_version = '5.0'
  s.ios.deployment_target = '13.0'
  
  s.source_files = 'TQIExtract/Classes/**/*.{h,m,swift}'
  s.resources = [
  'TQIExtract/Assets/*.xcassets',
  'TQIExtract/Classes/**/*.{xib}'
  ]
   
  s.public_header_files = 'Pod/Classes/**/*.swift'
  
  s.info_plist = {
    'Environment' => 'sandbox',
    'Protocol' => 'https',
    'Base_URL' => 'private-1c4f09-diobankapi.apiary-mock.com'
  }
  
   s.dependency 'VFNetwork'
end
