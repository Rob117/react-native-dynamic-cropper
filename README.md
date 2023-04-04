# react-native-dynamic-cropper

## NOTE

This library is iOS only right now - Android coming soon as I near the app development phase of my next major project. This is to fulfill a specific need of a dynamic image cropper for both platforms that isn't available in a neat NPM package - I would love to have a custom solution, but right now bridging libraries with my lack of Obj-c and Android skill is all I can do.

PR's welcome

## Gif
![capybara cropped](https://github.com/rob117/react-native-dynamic-cropper/blob/master/images/capybara.gif)

## Warning

This library is no longer maintained

## Roadmap

Add android support -

Hurry up on all the cool backend stuff for a certain project so I can work on this library!

* Circular crop option (easy PR)
* Options - background, aspect ratio locked, toolbar at top option (easy PR)
* Fix dev dependency errors (PR welcome from someone in the know).
* Specify version of library that this is dependent on (Easy PR for anyone with experience)
* Locale support? (What about unsupported locales? -> PR to wrapped library will fix it)
* Upgrade to swift when RN has better Swift support (PR's TOTALLY welcome here)

Add the following library - can I create a Kotlin bridge? Is that wise? Because I use Kotlin at work, and it is the bee's knees.
https://github.com/Yalantis/uCrop

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
platform :ios, '9.0'

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

# I have problems with UUID error messages running rampant on my dev machine, so this.
install! 'cocoapods',
         :deterministic_uuids => false

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

Coming soon, TM.

## Usage

```javascript
import DynamicCropper from "react-native-dynamic-cropper";

DynamicCropper.cropImage(pathToImageOnDisk, {cancelText: "anything", confirmText: "You can leave these blank", title: "also optional", filePath: "Absolute path on a simulator, otherwise the path that your imagepicker gives you"}).then(newlyCroppedImagePath =>
  console.log(newlyCroppedImagePath)
);
```

NOTE: if you don't want to pass in any special options and just want all defaults, you still have to pass in an empty object, like so:
```javascript
DynamicCropper.cropImage(pathToImageOnDisk, {})
```

## Working on this library

So, basically what I've found is the easiest way to do it (at least for iOS) is to react-native init a new project.

Then enter the project, yarn add this repo, pod install, open ios workspace in Xcode, go to pods/developmentPods/RNDynamicCropper/*, and edit those files. run react-native run-ios to observe changes. Profit.

When you have the files working the way you want, clone the repo, change the files to match the above edited ones (check iOS/src/*), then PR.

NOTE: For app.js, just copy-paste the premade one I have here as sampleAppjs.js, and edit the image param to work for you. Makes things way faster.

## License

MIT, MIT for TOCropper, APACHE 2.0 for Yalantis
Specifically, I really just want people to use this, so feel free to use it however you like. If you could put a credit somewhere, that would be awesome but absolutely isn't necessary.

## In case of abandonment

If I don't respond to any issues or pull requests in 60 days, I officially support the react native community github group cloning this project and becoming the official maintainers. Please note that simply not making any commits is not the same as relinquishing control - this is basically a clause so that if I decide I'm not maintaining this anymore or if something happens to me, the community gets my code.
