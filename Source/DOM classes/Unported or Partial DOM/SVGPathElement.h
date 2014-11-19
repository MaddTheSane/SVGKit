//
//  SVGPathElement.h
//  SVGKit
//
//  Copyright Matt Rajca 2010-2011. All rights reserved.
//

#import "BaseClassForAllSVGBasicShapes.h"
#import "BaseClassForAllSVGBasicShapes_ForSubclasses.h"

@class SVGClipPathElement;

@interface SVGPathElement : BaseClassForAllSVGBasicShapes { }

@property (readwrite, strong) NSString *clipPathIdentifier;

@end
