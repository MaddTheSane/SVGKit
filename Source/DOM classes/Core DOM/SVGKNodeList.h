/*
 Implemented internally via an NSArray
 
 NB: contains a slight "upgrade" from the SVG Spec to make it support Objective-C's
 Fast Enumeration feature
 
 From SVG DOM, via CoreDOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-536297177
 
 interface NodeList {
 Node               item(in unsigned long index);
 readonly attribute unsigned long    length;
 };

 */
#import <Foundation/Foundation.h>

#import "SVGKNode.h"

@interface SVGKNodeList : NSObject

@property(readonly) long length;

-(SVGKNode*) item:(NSInteger) index;

@end

@interface SVGKNodeList (CocoaExtensions) <NSFastEnumeration>

- (SVGKNode*)objectAtIndexedSubscript:(NSInteger)idx;

@end
