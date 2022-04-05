#import "AppDelegate.h"
#import "React/RCTBridgeModule.h"
#import "React/RCTUtils.h"

@interface RCT_EXTERN_MODULE(Facetec, NSObject)

RCT_EXTERN_METHOD(
  setup:(NSString *)appTheme
  resolver:(RCTPromiseResolveBlock *)resolve
  rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(
  initialization:(RCTPromiseResolveBlock *)resolve
  rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(
  authorization:(RCTPromiseResolveBlock *)resolve
  rejecter:(RCTPromiseRejectBlock)reject)

@end
