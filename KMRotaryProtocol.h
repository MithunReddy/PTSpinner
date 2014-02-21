//
//  KMRotaryProtocol.h
//  ProjectDuration
//
//  Created by nunc03 on 2/21/14.
//  Copyright (c) 2014 Mithun Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KMRotaryProtocol <NSObject>
- (void) wheelDidChangeValue:(NSString *)newValue;
@end
