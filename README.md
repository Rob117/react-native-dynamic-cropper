
# react-native-dynamic-cropper

## NOTE

This library is iOS only right now - Android coming soon, I hope. This is to fulfill a specific need of a dynamic image cropper for both platforms that isn't available in a neat NPM package.

`$ npm install react-native-dynamic-cropper --save`

### First Step

`$ react-native link react-native-dynamic-cropper`

### iOS

Cocoapods support only - the library is a react-native wrapper for another library which means that you have to install that one as well.

```
cd ios
pod init
```

podfile:

```
platform :ios, '9.0'

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

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-dynamic-cropper` and add `RNDynamicCropper.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNDynamicCropper.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.robsherling.react-native-dynamic-cropper.RNDynamicCropperPackage;` to the imports at the top of the file
  - Add `new RNDynamicCropperPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-dynamic-cropper'
  	project(':react-native-dynamic-cropper').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-dynamic-cropper/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-dynamic-cropper')
  	```


## Usage
```javascript
import DynamicCropper from 'react-native-dynamic-cropper';

// TODO: What to do with the module?
DynamicCropper;
```
  