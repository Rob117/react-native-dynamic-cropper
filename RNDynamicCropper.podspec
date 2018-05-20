package = JSON.parse(File.read(File.join(__dir__, "package.json")))
version = package['version']

Pod::Spec.new do |s|
  s.name         = "RNDynamicCropper"
  s.version      = version
  s.summary      = package["description"]
  s.homepage     = "n/a"
  s.license      = "MIT"
  s.platform     = :ios, "7.0"
  s.authors      = { "rob117" => "" }
  s.source       = { :git => "https://github.com/rob117/react-native-dynamic-cropper.git", :tag => 'v#{version}' }
  s.source_files  = "ios/*.{h,m}"
  s.requires_arc = true
  s.dependency "React"
  s.dependency "TOCropViewController"
end

  