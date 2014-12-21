#import "SVGKImageView.h"

@implementation SVGKImageView

@dynamic image;
@synthesize showBorder = _showBorder;

- (instancetype)init
{
	if( [self class] == [SVGKImageView class])
	{
		NSAssert(false, @"You cannot init this class directly. Instead, use a subclass e.g. SVGKFastImageView");
		
		return nil;
	}
	else
		return [super init];
}

-(instancetype)initWithFrame:(CGRect)frame
{
	if( [self class] == [SVGKImageView class])
	{
		NSAssert(false, @"You cannot init this class directly. Instead, use a subclass e.g. SVGKFastImageView");
		
		return nil;
	}
	else
		return [super initWithFrame:frame];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	if( [self class] == [SVGKImageView class])
	{
		NSAssert(false, @"Xcode is trying to load this class from a StoryBoard or from a NIB/XIB files. You cannot init this class directly - in your Storyboard/NIB file, set the Class type to one of the subclasses, e.g. SVGKFastImageView");
		
		return nil;
	}
	else
		return [super initWithCoder:aDecoder];
}

- (instancetype)initWithSVGKImage:(SVGKImage*) im
{
	NSAssert(false, @"Your subclass implementation is broken, it should be calling [super init] not [super initWithSVGKImage:]. Instead, use a subclass e.g. SVGKFastImageView");
    
    return nil;
}

/**
 The intrinsic sized of the image view.
 
 This is useful for playing nicely with autolayout.

 @return The size of the image if it has one, or CGSizeZero if not
 */
- (CGSize)intrinsicContentSize {
    if ([self.image hasSize]) {
        return self.image.size;
    }

    return CGSizeZero;
}

@end
