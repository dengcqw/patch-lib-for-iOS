//
//  patch.h
//  patch
//
//  Created by DengJinlong on 12/31/15.
//  Copyright © 2015 dengjinlong. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @brief apply a diff file to a target file
 
 @param patchFile file created by `diff -u `
 @param options   patch options split by space like  @[@"-p", @"-r"] 
 
 @return success or fail
 */
BOOL applyPatch(NSString *targetFile, NSString *patchFile, NSArray<NSString *> *options);
