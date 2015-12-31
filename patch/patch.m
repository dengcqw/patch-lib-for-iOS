//
//  patch.m
//  patch
//
//  Created by DengJinlong on 12/31/15.
//  Copyright © 2015 dengjinlong. All rights reserved.
//

#import "patch.h"
#import "c_patch.c"

@implementation patch

- (BOOL)applyPatch:(NSString *)patchFile to:(NSString *)distFile; {
    int ret = applyPatch((char*)[distFile cStringUsingEncoding:NSUTF8StringEncoding], (char*)[patchFile cStringUsingEncoding:NSUTF8StringEncoding]);
    return ret==0?YES:NO; 
}

@end
