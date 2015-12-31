//
//  patch.m
//  patch
//
//  Created by DengJinlong on 12/31/15.
//  Copyright © 2015 dengjinlong. All rights reserved.
//

#import "patch.h"
#import "c_patch.c"

BOOL applyPatch(NSString *distFile, NSString *patchFile) {
    int argc = 3;
    char* argv[3];
    argv[0] = "patch";
    argv[1] = (char*)[distFile cStringUsingEncoding:NSUTF8StringEncoding];
    argv[2] = (char*)[patchFile cStringUsingEncoding:NSUTF8StringEncoding];
    int ret = patch_main(argc, argv);
    return ret==0?YES:NO; 
}
