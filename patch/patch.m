//
//  patch.m
//  patch
//
//  Created by DengJinlong on 12/31/15.
//  Copyright © 2015 dengjinlong. All rights reserved.
//

#import "patch.h"
#import "c_patch.c"

BOOL applyPatch(NSString *targetFile, NSString *patchFile, NSArray<NSString *> *options) {
    int argc = (int)(3+options.count);
    char** argv = malloc(argc*sizeof(char *));
    NSUInteger idx = 0;
    argv[idx++] = "patch";
    for (NSString *option in options) {
        argv[idx++] = (char*)[option cStringUsingEncoding:NSUTF8StringEncoding];
    }
    argv[idx++] = (char*)[targetFile cStringUsingEncoding:NSUTF8StringEncoding];
    argv[idx++] = (char*)[patchFile cStringUsingEncoding:NSUTF8StringEncoding];
    argv[idx++] = "--strip"; // avoid no difference interrupt
    int ret = patch_main(argc, argv);
    return ret==0?YES:NO; 
}
