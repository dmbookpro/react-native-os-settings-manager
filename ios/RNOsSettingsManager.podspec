
Pod::Spec.new do |s|
  s.name         = "RNOsSettingsManager"
  s.version      = "1.1.2"
  s.summary      = "RNOsSettingsManager"
  s.description  = <<-DESC
  This is a native module to interact with Android/IOS settings.
                   DESC
  s.homepage     = "https://github.com/dmbookpro/react-native-os-settings-manager"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/dmbookpro/react-native-os-settings-manager.git", :tag => "1.1.2" }
  s.source_files  = "RNOsSettingsManager/**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"

end

  
