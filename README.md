# react-native-dynamic-cropper

## NOTE

This library is iOS only right now - Android coming soon, I hope. This is to fulfill a specific need of a dynamic image cropper for both platforms that isn't available in a neat NPM package.

## Gif
![capybara cropped](https://github.com/rob117/react-native-dynamic-cropper/blob/master/images/capybara.gif)

## Warning

This library was just released, so it still does not have error handing, test cases, etc. I plan to introduce those things as fast as possible.

## Roadmap

Circular crop option
Locale support (What about unsupported locales? -> PR to wrapped library will fix it)
Title, done button, cancel button custom text
Add testing script (it's not pretty, but it totally works)
Options - background, aspect ratio locked, toolbar at top option

## Install

`yarn add react-native-dynamic-cropper`

### iOS

Cocoapods support only - the library is a react-native wrapper for another library, so we use Cocoapods to manage all of our dependencies. Make sure you have the Cocoapods gem installed.

```
cd ios
pod init
```

Example Podfile:

```
platform :ios, '8.0'

target '<project_name>' do
  # This allows us to install our locally-included React pod. Have this in your file.
  # learned from https://github.com/ivpusic/react-native-image-crop-picker
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

  # This pod
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

### Android

Not there yet.

## Usage

```javascript
import DynamicCropper from "react-native-dynamic-cropper";

DynamicCropper.cropImage(pathToImageOnDisk).then(newlyCroppedImagePath =>
  console.log(newlyCroppedImagePath)
);
```

## Working on this library

So, basically what I've found is the easiest way to do it (at least for iOS) is to react-native init a new project.

Then enter the project, yarn add this repo, pod install, open ios workspace in Xcode, go to pods/developmentPods/RNDynamicCropper/*, and edit those files. run react-native run-ios to observe changes. Profit.

When you have the files working the way you want, clone the repo, change the files to match the above edited ones (check iOS/src/*), then PR.

I have a script that automates the app setup with a working App.js, moving images to the correct places, etc.

I will add it here soon.

## License

MIT

## In case of abandonment

If I don't respond to any issues or pull requests in 60 days, assume the worst. In that case, I officially support the react native community github group cloning this project and becoming the official maintainers.
