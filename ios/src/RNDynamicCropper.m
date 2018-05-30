//
//  RNDynamicCropper.m
//  camtest
//
//  Created by Robert Sherling on 2018/05/05.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "RNDynamicCropper.h"
#import "React/RCTLog.h"

#if __has_include("TOCropViewController.h")
#import "TOCropViewController.h"
#elif __has_include(<TOCropViewControllerController/TOCropViewControllerController.h>)
#import <TOCropViewControllerController/TOCropViewControllerController.h>
#else
#import "TOCropViewController/TOCropViewController.h"
#endif

@interface RNDynamicCropper()
@property(nonatomic, strong) RCTPromiseResolveBlock resolver;
@property(nonatomic, strong) RCTPromiseRejectBlock reject;
@end

@implementation RNDynamicCropper

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(cropImage:(NSString *)path resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject){
  self.resolver = resolve;
  self.reject = reject;
  dispatch_async(dispatch_get_main_queue(), ^{
    // This code pretty much never chages. Take the path command that we passed from JS.
    // Read that data into an image. Open the image in the cropper.
    // Profit.
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    TOCropViewController *cropViewController = [[TOCropViewController alloc] initWithImage:image];
    cropViewController.delegate = self;
    UINavigationController* contactNavigator = [[UINavigationController alloc] initWithRootViewController:cropViewController];
     [[self getRootVC] presentViewController:contactNavigator animated:NO completion:nil];
  });
}

// Copied from https://github.com/ivpusic/react-native-image-crop-picker/blob/master/ios/src/ImageCropPicker.m
// Actually, pretty much this whole thing was like 5 tutorials and looking at this for reference, and help from an amazing freelancer.
- (UIViewController*) getRootVC {
  UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  while (root.presentedViewController != nil) {
    root = root.presentedViewController;
  }
  
  return root;
}

-(void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle
{
  // Just a way to get file paths
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"temp.jpg"];

  // Write our image data to the above specified path (wherever + temp)
  [UIImageJPEGRepresentation(image, 1.0) writeToFile:filePath atomically:YES];
  // Close the UIView
  [cropViewController dismissViewControllerAnimated:YES completion:nil];
  // Return the path so it can be manipulated elsewhere.
  self.resolver(filePath);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
