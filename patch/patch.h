//
//  patch.h
//  patch
//
//  Created by DengJinlong on 12/31/15.
//  Copyright © 2015 dengjinlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface patch : NSObject
//int applyPatch(char *distFile, char *patchFile);
- (BOOL)applyPatch:(NSString *)patchFile to:(NSString *)distFile; 
@end
