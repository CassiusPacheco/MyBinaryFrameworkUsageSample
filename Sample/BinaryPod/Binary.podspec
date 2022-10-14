Pod::Spec.new do |s|
    s.name             = "MyBinaryFramework"
    s.version          = "0.0.1"
    s.summary          = "MyBinaryFramework"
    s.description      = <<-DESC
    MyBinaryFramework
                          DESC
    s.homepage         = "https://github.com/CassiusPacheco/MyBinaryFramework"
    s.license          = 'MIT'
    s.author           = { "Cassius Pacheco" => "cassius.op@icloud.com" }
    s.source           = { :http => "https://github.com/CassiusPacheco/MyBinaryFramework/releases/download/v0.0.1/MyBinaryFramework.zip" }
  
    s.cocoapods_version = '>= 1.10.0'
  
    s.vendored_frameworks = "MyBinaryFramework.xcframework"
  
    s.dependency 'Valet'
  
    s.swift_version = '5.7'
  end