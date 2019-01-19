//
//  RNDynamicCropper.h
//  camtest
//
//  Created by Robert Sherling on 2018/05/05.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridge.h>

// Learned from https://gist.github.com/jacksonfdam/3000412
// I don't think that a singleton to store this is best practice. I also don't have any obj-c experience, so here we are.
// If you can clean this, PR 100% welcome

@interface GlobalVars : NSObject
{
    NSString *filePath; // global variable
}

@property(nonatomic, retain) NSString *filePath;

+ (GlobalVars *)sharedGlobalVars;

@end

@interface RNDynamicCropper : NSObject <RCTBridgeModule>
@end
