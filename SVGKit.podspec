Pod::Spec.new do |s|
  s.name        = 'SVGKit'
  s.version     = '2.x'
  s.license     = 'MIT'
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"

  s.summary     = "Display and interact with SVG Images on iOS, using native rendering (CoreAnimation)."
  s.homepage = 'https://github.com/SVGKit/SVGKit'
  s.author   = { 'Steven Fusco'    => 'github@stevenfusco.com',
                 'adamgit'         => 'adam.m.s.martin@gmail.com',
                 'Kevin Stich'     => 'stich@50cubes.com',
                 'Joshua May'      => 'notjosh@gmail.com',
                 'Eric Man'        => 'meric.au@gmail.com',
                 'Matt Rajca'      => 'matt.rajca@me.com',
                 'Moritz Pfeiffer' => 'moritz.pfeiffer@alp-phone.ch',
                 'Steven Fusco'    => 'sfusco@spiral.local',
                 'Eric Man'        => 'Eric@eric-mans-macbook-2.local',
                 'C.W. Betts'      => 'computers57@hotmail.com' }
  s.source   = { :git => 'https://github.com/MaddTheSane/SVGKit.git', :branch => "master" }

  s.ios.source_files = 'Source/*{.h,m}', 'Source/DOM classes/**/*.{h,m}', 'Source/Exporters/*.{h,m}', 'Source/Parsers/**/*.{h,m}', 'Source/QuartzCore additions/**/*.{h,m}', 'Source/Sources/**/*.{h,m}', 'Source/UIKit additions/**/*.{h,m}', 'Source/Shared additions/**/*.{h,m}', 'Source/Unsorted/**/*.{h,m}'
  s.ios.exclude_files =  'Source/DOM classes/**/*{OSX}.{h,m}', 'Source/Exporters/SVGKExporterNSData.{h,m}'

  s.osx.source_files = 'Source/*{.h,m}', 'Source/DOM classes/**/*.{h,m}', 'Source/Exporters/*.{h,m}', 'Source/Parsers/**/*.{h,m}', 'Source/QuartzCore additions/**/*.{h,m}', 'Source/Sources/**/*.{h,m}', 'Source/AppKit additions/**/*.{h,m}', 'Source/Shared additions/**/*.{h,m}', 'Source/Unsorted/**/*.{h,m}', 'Source/UIKit additions/*View*.h'
  s.osx.exclude_files = 'Source/DOM classes/**/*{iOS}.{h,m}', 'Source/Exporters/SVGKExporterUIImage.{h,m}'


  s.libraries = 'xml2'
  s.framework = 'QuartzCore', 'CoreText'
  s.dependency 'CocoaLumberjack', '~> 2.x'
  s.ios.prefix_header_file = 'XCodeProjectData/SVGKit-iOS/SVGKit-iOS-Prefix.pch'
  s.osx.prefix_header_file = 'XCodeProjectData/SVGKit-OSX/SVGKit-OSX-Prefix.pch'

  s.requires_arc = true
  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++11',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2'
  }
end
