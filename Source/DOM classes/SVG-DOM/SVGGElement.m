#import "SVGGElement.h"
#import "CALayerWithChildHitTest.h"
#import "CAShapeLayerWithHitTest.h"
#import "SVGHelperUtilities.h"

@implementation SVGGElement 

@synthesize transform; // each SVGElement subclass that conforms to protocol "SVGTransformable" has to re-synthesize this to work around bugs in Apple's Objective-C 2.0 design that don't allow @properties to be extended by categories / protocols

- (void)postProcessAttributesAddingErrorsTo:(SVGKParseResult *)parseResult
{
	[super postProcessAttributesAddingErrorsTo:parseResult];
	
	//AH HA! I need to add a clip-path reference here! w00t!
	[self parseClipPath:[self getAttribute:@"clip-path"]];
	
	
}


//Okay--Assumption right now is that there is always going to be a reference for a clip-path via a URL---And it's the correct assumption!

//An IRI reference to another GRAPHICAL object within the same SVG document fragment which will be used as the clipping path.
//If the IRI reference is not valid (e.g it points to an object that doesn't exist or the object is not a ‘clipPath’ element)
//the ‘clip-path’ property must be treated as if it hadn't been specified.
- (void)parseClipPath:(NSString *)clipPathIdentifier
{
	
	if (!clipPathIdentifier)
		return;
	
	NSRange locationRange = [clipPathIdentifier rangeOfString:IRIDelimitterStart];
	
	if (locationRange.location != NSNotFound)
	{
		
		NSUInteger loc = locationRange.location + locationRange.length;
		
		NSRange identifierRange = NSMakeRange(loc, clipPathIdentifier.length - (loc + 1));
		NSString *identifier = [clipPathIdentifier substringWithRange:identifierRange];
		
		self.clipPathIdentifier = identifier;
		
	}
	else
		return;
	
	
}

- (CALayer *) newLayer
{
	
	CALayer* _layer = [CALayerWithChildHitTest layer];
	
	[SVGHelperUtilities configureCALayer:_layer usingElement:self];
	
	return _layer;
}

- (void)layoutLayer:(CALayer *)layer {
	
    //Add the masks here?
    
    // null rect union any other rect will return the other rect
	CGRect mainRect = CGRectNull;
	
	
	/** make mainrect the UNION of all sublayer's frames (i.e. their individual "bounds" inside THIS layer's space) */
	for ( CALayer *currentLayer in [layer sublayers] )
	{
//		if ([currentLayer valueForKey:kSVGElementIdentifier])
//		{
//			for (SVGElement *aNode in [self childNodes])
//			{
//				if ([[aNode identifier] isEqualToString:[currentLayer valueForKey:kSVGElementIdentifier]])
//				{
//					
//					
//					
//				}
//			}
//		}
		
		CGRect subLayerFrame = currentLayer.frame;
		mainRect = CGRectUnion(mainRect, subLayerFrame);
	}
	
	/** use mainrect (union of all sub-layer bounds) this layer's FRAME
	 
	 i.e. top-left-corner of this layer will be "the top left corner of the convex-hull rect of all sublayers"
	 AND: bottom-right-corner of this layer will be "the bottom-right corner of the convex-hull rect of all sublayers"
	 */
	layer.frame = mainRect;

	/** Changing THIS layer's frame now means all DIRECT sublayers are offset by too much (because when we change the offset
	 of the parent frame (this.frame), Apple *does not* shift the sublayers around to keep them in same place.
	 
	 NB: there are bugs in some Apple code in Interface Builder where it attempts to do exactly that (incorrectly, as the API
	 is specifically designed NOT to do this), and ... Fails. But in code, thankfully, Apple *almost* never does this (there are a few method
	 calls where it appears someone at Apple forgot how their API works, and tried to do the offsetting automatically. "Paved
	 with good intentions...".
	 	 */
    if (CGRectIsNull(mainRect)) {
        // TODO what to do when mainRect is null rect? i.e. no sublayer or all sublayers have null rect frame
        // OR in my case, somehow they are still null..
    } else {
        for (CALayer *currentLayer in [layer sublayers]) {
            CGRect frame = currentLayer.frame;
            frame.origin.x -= mainRect.origin.x;
            frame.origin.y -= mainRect.origin.y;
            currentLayer.frame = frame;
        }
    }
}

- (CAShapeLayer *)shapeLayerWithID:(NSString *)SVGElementID
{
    
    for (CAShapeLayerWithHitTest *clipPathlayer in self.clipPathArray)
    {
        
        if ([[clipPathlayer valueForKey:kSVGElementIdentifier] isEqualToString:SVGElementID])
            return clipPathlayer;
        
    }
    
    return nil;
    
}

@end
