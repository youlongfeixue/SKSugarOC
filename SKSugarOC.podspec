#
# Be sure to run `pod lib lint SKSugarOC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SKSugarOC'
  s.version          = '0.1.1'
  s.summary          = 'A short description of SKSugarOC.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/tonysky/SKSugarOC'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tonycgao@sina.com' => 'tonycgao@sina.com' }
  s.source           = { :git => 'https://github.com/tonysky/SKSugarOC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Classes/**/*'
  
  # s.resource_bundles = {
  #   'SKSugarOC' => ['SKSugarOC/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end


#0. 将设备选择为 Any iOS Device(arm64)，并编译
#
#1. 提交版本
#   修改 .podspec 文件版本号，push工程
#
#2. 打tag，提交tag (跟版本号同步)
#    //为git打tag, 第一次需要在前面加一个v (跟文件版本号一致)
#    git tag "v1.0.0" 
#    //将tag推送到远程仓库
#    git push --tags 
#
#3. 验证 .podspec文件
#    // --verbose 如果验证失败会报错误信息
#    pod spec lint --verbose --allow-warnings
#
#4. 发布
#    pod trunk push --allow-warnings




