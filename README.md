
# react-native-dynamic-cropper

## Getting started

`$ npm install react-native-dynamic-cropper --save`

### Mostly automatic installation

`$ react-native link react-native-dynamic-cropper`

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
import RNDynamicCropper from 'react-native-dynamic-cropper';

// TODO: What to do with the module?
RNDynamicCropper;
```
  