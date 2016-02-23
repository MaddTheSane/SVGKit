//
//  CATextShapeLayer.h
//  CATextShapeLayerTest
//
//  Created by William Jones on 12/19/14.
//  Copyright (c) 2014 Treblotto Music and Music Tech. All rights reserved.
//	~TM|MT~



#import <Quartz/Quartz.h>
//#import "NSBezierPath+Boolean.h"
//#import "NSBezierPath+Utilities.h"
//#import "NSBezierPath+SCPVectorKit.h"

typedef NS_ENUM(NSInteger, TMMTVerticalTextAlignment)
{
	TMMTDefaultAlignment = -1,
	TMMTTopAlignment = 0,
	TMMTCenterAlignment,
	TMMTBottomAlignment,
	
};

/*!
 
 @header TMMTTextLayer
 
 @brief A CAShapeLayer subclass that renders text as a CGPath, instead of compositing the text into a backing store like other classes. This class is useful if you are using strings or attributed strings that have the same attributes throughout the entire string.  If you have varying attributes, you should use the @b TMMTAttributedTextLayer instead.  Also, if your superlayer has its property geometryFlipped set to true, you need to to so here as well.  TMMTLayers do not add AffineTransforms to compensate for flippedness.
 
 
 @discussion This will be a multi-phased project.  Currently there is support for whatever the font natively supports.
 @par 1. Creating the TextShapeLayer to render text as a path - Completed 12/19/14
 @par 2. Altering the behavior so that it can accept attributed strings and add different shape layers for each run. - Completed 12/20/14
 @par 3. Adding Support For strikethrough and underline by using Vector Boolean by Fortunate Bear--Which may not be possible.  It seems I may need another layer, which ends up making things look *bleh*.
 @par 4. Adding support for truncation modes
 
 
 
 
 
 */
@interface SVGKTextLayer : CAShapeLayer

/*!
 
 @brief Set the text (la ti doooo!) that you want to render to this property.
 @param string the text you want displayed in the layer.  It can be an @c NSAttributedString or a @c NSString.  No @c CFAttributedStringRefs please.
 
 */
@property (copy) id string;

@property (retain) NSFont *textFont;
@property (retain) NSColor *textColor;
@property (retain) NSColor *textStrokeColor;
@property (assign) CGFloat strokeWidth;
@property (assign) NSTextAlignment paragraphAlignment;
@property (assign) NSUInteger ligatureType;
@property (readonly, assign) NSSize stringSize;
@property (assign) TMMTVerticalTextAlignment verticalAlignment;
@property (readwrite, copy) NSColor *contextColor;

@property (readwrite, assign) BOOL displayBoundingBoxOfText;



- (void)setAlignmentMode:(NSString *)alignment;
- (void)setFont:(CFTypeRef)font;
- (void)setForegroundColor:(CGColorRef)color;
- (void)setFontSize:(NSUInteger)fontSize;
- (void)updateTextFont:(NSFont *)newFont;

@property (readwrite, copy) NSString *truncationMode;
@property (readwrite, assign, getter=isWrapped) BOOL wrapped;


/*!
 
 @brief currently not implemented does nothing
 
 */
@property (assign) BOOL underlined;
@property (assign) BOOL strikethrough;
@property (retain) NSColor *strikethroughColor;

//The properties that I will have to replace in my new class.

@end
