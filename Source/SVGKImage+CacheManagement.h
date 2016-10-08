#import "SVGKImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface SVGKImage (CacheManagementPrivate)
+ (void)storeImageCache:(SVGKImage*)theImage forName:(NSString*)theName;

#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE)
+(void) didReceiveMemoryWarningNotification:(NSNotification*) notification;
#endif

@end

NS_ASSUME_NONNULL_END
