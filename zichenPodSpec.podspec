#
#  Be sure to run `pod spec lint zichenPodSpec.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "zichenPodSpec"
  s.version      = "0.0.1"
  s.summary      = "制作CocoPods私有库"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
    这里要添加描述,这里的描述信息要比上面的summary要长一些, 要不然编译不过
                   DESC

  s.homepage     = "https://github.com/ziChen0422/podSpecDemo"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "zichen0422" => "zichen0422@gmail.com" }
  # Or just: s.author    = "zichen0422"
  # s.authors            = { "zichen0422" => "zichen0422@gmail.com" }
  # s.social_media_url   = "http://twitter.com/zichen0422"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
   s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/ziChen0422/podSpecDemo.git", :commit => "5ba006fe378716e2860dbf6581bc557c9671ba16" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

    s.source_files  = "zichenPodSpec/zichenHeader.h"
    #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

    s.subspec "zichenPodSpec" do |zichenpodspec|
#zichenpodspec.subspec "Help" do |help|
#            help.source_files = "zichenPodSpec/Help/*.{h,m}"
#       end

        zichenpodspec.subspec "zichenPodDirOne" do |zichenpoddirone|
            zichenpoddirone.source_files = "zichenPodSpec/zichenPodDirOne/*.{h,m}"
            zichenpoddirone.dependency 'AFNetworking'
            zichenpoddirone.vendored_frameworks = 'Pods/BaiduMapKit/BaiduMapKit/*.framework'
        end

        zichenpodspec.subspec "zichenPodDirTwo" do |zichenpoddirtwo|
            zichenpoddirtwo.source_files = "zichenPodSpec/zichenPodDirTwo/*.{h,m}"
            zichenpoddirtwo.dependency 'AFNetworking'
            # 如果要引用第一个子模块的东西,也是dependency, 但是相互之间不能引用
            # 这里有个注意点, 就是要引用前一个模块的, 需要给前一个模块打tag,也就是说前一个模块已经在github上有版本信息,才可以使用
            #zichenpoddirtwo.dependency 'zichenPodSpec/zichenPodDirOne'
        end
    end

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
    s.resource_bundles = {
        'imageBundle' => ['zichenPodSpec/zichenPodDirOne/*.{png}'],
        'xibbundle' => ['zichenPodSpec/**/*.{xib,storyboard}']
    }

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
    # 系统配置的framework
    s.frameworks = 'CoreLocation','QuartzCore','OpenGLES','SystemConfiguration','CoreGraphics','Security','CoreTelephony','UIKit'
    # 用户带入的framework
    s.vendored_frameworks = 'Pods/BaiduMapKit/BaiduMapKit/*.framework'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
     #   系统自带的lib文件
    s.libraries = "sqlite3.0", "stdc++.6.0.9"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
    s.dependency "AFNetworking"
#  s.dependency "BaiduMapKit", "~> 3.1.0"

end
