#import <Foundation/Foundation.h>

#if !TARGET_OS_IPHONE
#import <Cocoa/Cocoa.h>
#else
#import <UIKit/UIKit.h>
#endif
#import "SVGKImage.h"

/**
 * SVGKit's version of NS/UIImageView - with some improvements over Apple's design. There are multiple versions of this class, for different use cases.
 
 STANDARD USAGE:
   - SVGKImageView *myImageView = [[SVGKFastImageView alloc] initWithSVGKImage: [SVGKImage imageNamed:@"image.svg"]];
   - [self.view addSubview: myImageView];
 
 NB: the "SVGKFastImageView" is the one you want 9 times in 10 on iOS. The alternative classes (e.g. SVGKLayeredImageView) are for advanced usage.
 
 NB: read the class-comment for each subclass carefully before deciding what to use.
 
 */
#if !TARGET_OS_IPHONE
@interface SVGKImageView: NSView
#else
@interface SVGKImageView: UIView
#endif

@property(nonatomic) BOOL showBorder; /*< mostly for debugging - adds a coloured 1-pixel border around the image */
@property (nonatomic, strong) SVGKImage *image;

- (instancetype)initWithSVGKImage:(SVGKImage*) im;
- (instancetype)init;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (instancetype)initWithFrame:(CGRect)frame;

#if !TARGET_OS_IPHONE
//Default initializer for (Cocoa) subclasses. Will set the frame of the view and init with an image
- (instancetype)initWithSVGKImage:(SVGKImage*)im frame:(NSRect)theFrame;
#else
@property(nonatomic,readonly) NSTimeInterval timeIntervalForLastReRenderOfSVGFromMemory;
#endif

@end
