//
//  NSCharacterSet+SVGKExtensions.h
//  Avatar
//
//  Created by Devin Chalmers on 3/6/13.
//  Copyright (c) 2013 DJZ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSCharacterSet (SVGKExtensions)

+ (NSCharacterSet *)SVGWhitespaceCharacterSet;
@property (class, readonly, retain) NSCharacterSet *SVGWhitespaceCharacterSet;

@end

NS_ASSUME_NONNULL_END
