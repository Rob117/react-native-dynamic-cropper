
# react-native-dynamic-cropper

## NOTE

This library is iOS only right now - Android coming soon, I hope. This is to fulfill a specific need of a dynamic image cropper for both platforms that isn't available in a neat NPM package.

# DANGER

This is the first release of this library, and it is NOT functional right now. I'm currently working on resolving this issue, please stay tuned.

<!-- `$yarn add react-native-dynamic-cropper` -->

### iOS

Cocoapods support only - the library is a react-native wrapper for another library which means that you have to install that one as well.

```
cd ios
pod init
```

podfile:

```
platform :ios, '8.0'

target '<project_name>' do
  # this is very important to have!
  rn_path = '../node_modules/react-native'
  pod 'yoga', path: "#{rn_path}/ReactCommon/yoga/yoga.podspec"
  pod 'React', path: rn_path, subspecs: [
    'Core',
    'RCTActionSheet',
    'RCTAnimation',
    'RCTGeolocation',
    'RCTImage',
    'RCTLinkingIOS',
    'RCTNetwork',
    'RCTSettings',
    'RCTText',
    'RCTVibration',
    'RCTWebSocket'
  ]

  pod 'RNDynamicCropper', :path =>  '../node_modules/react-native-dynamic-cropper'
end

# very important to have, unless you removed React dependencies for Libraries 
# and you rely on Cocoapods to manage it
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == "React"
      target.remove_from_project
    end
  end
end
```

## Usage
```javascript
import DynamicCropper from 'react-native-dynamic-cropper';

// TODO: What to do with the module?
console.log(DynamicCropper) // Should not be null
```
  