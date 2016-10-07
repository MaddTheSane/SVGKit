/*!
 
 SVGKit - https://github.com/SVGKit/SVGKit
 
 THE MOST IMPORTANT ELEMENTS YOU'LL INTERACT WITH:
 
 1. SVGKImage = contains most of the convenience methods for loading / reading / displaying SVG files
 2. SVGKImageView = the easiest / fastest way to display an SVGKImage on screen
 3. SVGKLayer = the low-level way of getting an SVG as a bunch of layers
 
 SVGKImage makes heavy use of the following classes - you'll often use these classes (most of them given to you by an SVGKImage):
 
 4. SVGKSource = the "file" or "URL" for loading the SVG data
 5. SVGKParseResult = contains the parsed SVG file AND/OR the list of errors during parsing
 
 */

#include <TargetConditionals.h>

#import "SVGKDOMHelperUtilities.h"
#import "SVGCircleElement.h"
#import "SVGClipPathElement.h"
#import "SVGDefsElement.h"
#import "SVGDescriptionElement.h"
#import "SVGKImage.h"
#import "SVGElement.h"
#import "SVGEllipseElement.h"
#import "SVGGElement.h"
#import "SVGImageElement.h"
#import "SVGLineElement.h"
#import "SVGPathElement.h"
#import "SVGPolygonElement.h"
#import "SVGPolylineElement.h"
#import "SVGRectElement.h"
#import "BaseClassForAllSVGBasicShapes.h"
#import "SVGKSource.h"
#import "SVGTitleElement.h"
#import "SVGUtils.h"
#import "SVGKPattern.h"
#import "SVGKImageView.h"
#import "SVGKFastImageView.h"
#import "SVGKLayeredImageView.h"
#import "SVGKLayer.h"
#import "TinySVGTextAreaElement.h"
#if !TARGET_OS_IPHONE
#import "SVGKImageRep.h"
#else
#import "SVGKExporterUIImage.h"
#endif

typedef NS_ENUM(int, SVGKLoggingLevel)
{
	SVGKLoggingMixed = -1,
	SVGKLoggingOff = 0,
	SVGKLoggingInfo,
	SVGKLoggingWarning,
	SVGKLoggingError,
	SVGKLoggingVerbose
};

#ifndef SVGKIT_LOG_CONTEXT
    #define SVGKIT_LOG_CONTEXT 556
#endif

@interface SVGKit : NSObject

+ (void) enableLogging;
+ (void) setLogLevel:(SVGKLoggingLevel)newLevel;
+ (SVGKLoggingLevel) logLevel;
@property (class) SVGKLoggingLevel logLevel;

+ (void) setRawLogLevel:(NSUInteger)rawLevel;
+ (NSUInteger) rawLogLevel;
@property (class) NSUInteger rawLogLevel;

@end





// MARK: - Framework Header File Content

#import <Foundation/Foundation.h>

//! Project version number for SVGKitFramework.
FOUNDATION_EXPORT double SVGKitFramework_VersionNumber;

//! Project version string for SVGKitFramework.
FOUNDATION_EXPORT const unsigned char SVGKitFramework_VersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SVGKitFramework_iOS/PublicHeader.h>


#import "SVGKAppleSucksDOMImplementation.h"
#import "SVGKAttr.h"
#import "SVGKCDATASection.h"
#import "SVGKCharacterData.h"
#import "SVGKComment.h"
#import "SVGKCSSStyleDeclaration.h"
#import "SVGKCSSRule.h"
#import "SVGKCSSStyleSheet.h"
#import "SVGKCSSStyleRule.h"
#import "SVGKCSSRuleList.h"
#import "SVGKCSSRuleList+Mutable.h"
#import "SVGKCSSPrimitiveValue.h"
#import "SVGKCSSPrimitiveValue_ConfigurablePixelsPerInch.h"
#import "SVGKCSSValueList.h"
#import "SVGKCSSValue_ForSubclasses.h"
#import "SVGKCSSValue.h"
#import "SVGKDocument+Mutable.h"
#import "SVGKDocument.h"
#import "SVGKDocumentCSS.h"
#import "SVGKDocumentStyle.h"
#import "SVGKStyleSheetList+Mutable.h"
#import "SVGKStyleSheetList.h"
#import "SVGKStyleSheet.h"
#import "SVGKMediaList.h"
#import "SVGKDocumentFragment.h"
#import "SVGKDocumentType.h"
#import "SVGKDOMHelperUtilities.h"
#import "SVGKElement.h"
#import "SVGKEntityReference.h"
#import "SVGKNamedNodeMap.h"
#import "SVGKNamedNodeMap_Iterable.h"
#import "SVGKNode+Mutable.h"
#import "SVGKNode.h"
#import "SVGKNodeList+Mutable.h"
#import "SVGKNodeList.h"
#import "SVGKProcessingInstruction.h"
#import "SVGKText.h"
#import "SVGKDOMGlobalSettings.h"
#import "SVGAngle.h"
#import "SVGAnimatedPreserveAspectRatio.h"
#import "SVGDefsElement.h"
#import "SVGDocument.h"
#import "SVGDocument_Mutable.h"
#import "SVGElementInstance.h"
#import "SVGElementInstance_Mutable.h"
#import "SVGElementInstanceList.h"
#import "SVGElementInstanceList_Internal.h"
#import "SVGGElement.h"
#import "SVGStylable.h"
#import "SVGLength.h"
#import "SVGMatrix.h"
#import "SVGNumber.h"
#import "SVGPoint.h"
#import "SVGPreserveAspectRatio.h"
#import "SVGRect.h"
#import "SVGSVGElement_Mutable.h"
#import "SVGTransform.h"
#import "SVGUseElement.h"
#import "SVGUseElement_Mutable.h"
#import "SVGViewSpec.h"
#import "SVGHelperUtilities.h"
#import "SVGTransformable.h"
#import "SVGFitToViewBox.h"
#import "SVGTextPositioningElement.h"
#import "SVGTextContentElement.h"
#import "SVGTextPositioningElement_Mutable.h"
#import "ConverterSVGToCALayer.h"
#import "SVGGradientElement.h"
#import "SVGGradientStop.h"
#import "SVGStyleCatcher.h"
#import "SVGStyleElement.h"
#import "SVGCircleElement.h"
#import "SVGDescriptionElement.h"
#import "SVGElement.h"
#import "SVGElement_ForParser.h"
#import "SVGEllipseElement.h"
#import "SVGGroupElement.h"
#import "SVGImageElement.h"
#import "SVGLineElement.h"
#import "SVGPathElement.h"
#import "SVGPolygonElement.h"
#import "SVGPolylineElement.h"
#import "SVGRectElement.h"
#import "BaseClassForAllSVGBasicShapes.h"
#import "BaseClassForAllSVGBasicShapes_ForSubclasses.h"
#import "SVGSVGElement.h"
#import "SVGTextElement.h"
#import "SVGTitleElement.h"
#import "CALayerExporter.h"
#import "SVGKImage+CGContext.h"
#import "SVGKExporterNSData.h"
#if TARGET_OS_IPHONE || TARGET_OS_IOS || TARGET_OS_WATCH || TARGET_OS_TV
#import "SVGKExporterUIImage.h"
#endif
#import "SVGKSourceLocalFile.h"
#import "SVGKSourceString.h"
#import "SVGKSourceURL.h"
#import "SVGKParserDefsAndUse.h"
#import "SVGKParserDOM.h"
#import "SVGKParserGradient.h"
#import "SVGKParserPatternsAndGradients.h"
#import "SVGKParserStyles.h"
#import "SVGKParserSVG.h"
#import "SVGKParser.h"
#import "SVGKParseResult.h"
#import "SVGKParserExtension.h"
#import "SVGKPointsAndPathsParser.h"
#import "CALayer+RecursiveClone.h"
#import "SVGGradientLayer.h"
#import "CALayerWithChildHitTest.h"
#import "CAShapeLayerWithHitTest.h"
#import "CGPathAdditions.h"
#import "SVGKLayer.h"
#import "SVGKImage.h"
#import "SVGKSource.h"
#import "NSCharacterSet+SVGKExtensions.h"
#import "SVGKFastImageView.h"
#import "SVGKImageView.h"
#import "SVGKLayeredImageView.h"
#import "SVGKPattern.h"
#import "SVGUtils.h"

#import "NSData+NSInputStream.h"
#import "SVGKSourceNSData.h"
#import "SVGSwitchElement.h"
