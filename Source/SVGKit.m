//
//  SVGKit.m
//  SVGKit-iOS
//
//  Created by Devon Blandin on 5/13/13.
//  Copyright (c) 2013 na. All rights reserved.
//

#import "SVGKit.h"
#import <CocoaLumberjack/CocoaLumberjack.h>

#ifdef DEBUG
static const DDLogLevel defaultLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel defaultLogLevel = DDLogLevelWarning;
#endif

#if IS_ALSO_LUMBERJACK_LOG_LEVEL
NSUInteger ddLogLevel = defaultLogLevel;
#define ddLogLevelInternal ddLogLevel
#else
static DDLogLevel ddLogLevelInternal = defaultLogLevel;
NSUInteger SVGCurrentLogLevel()
{
	return ddLogLevelInternal;
}
#endif

#undef DEFAULT_LOG_LEVEL

@implementation SVGKit : NSObject

+ (SVGKLoggingLevel) logLevel
{
	SVGKLoggingLevel retVal;
	switch (ddLogLevelInternal) {
		case DDLogLevelError:
			retVal = SVGKLoggingError;
			break;
			
		case DDLogLevelInfo:
			retVal = SVGKLoggingInfo;
			break;
			
		case DDLogLevelOff:
			retVal = SVGKLoggingOff;
			break;
			
		case DDLogLevelVerbose:
			retVal = SVGKLoggingVerbose;
			break;
			
		case DDLogLevelWarning:
			retVal = SVGKLoggingWarning;
			break;
			
		default:
			retVal = SVGKLoggingMixed;
			break;
	}
	return retVal;
}

static dispatch_once_t rawLogLevelToken;
#define RawLevelWarn() dispatch_once(&rawLogLevelToken, ^{ \
NSLog(@"[%@] WARN: Only set/get the raw log level if you know what you're doing!", self); \
})

+ (NSUInteger) rawLogLevelWithWarning:(BOOL)warn
{
	if (warn) {
		RawLevelWarn();
	}
	
	return ddLogLevel;
}

+ (NSUInteger) rawLogLevel
{
	return [self rawLogLevelWithWarning:YES];
}

+ (void) setRawLogLevel:(NSUInteger)rawLevel withWarning:(BOOL)warn
{
#define LOGFLAGCHECK(theFlag, mutStr, logVal) \
if ((logVal & theFlag) == theFlag) { \
NSString *tmpStr = @#theFlag; \
if (mutStr.length == 0) { \
[mutStr setString:tmpStr]; \
} else { \
[mutStr appendFormat:@" %@", tmpStr]; \
} \
}
	
	if (warn) {
		RawLevelWarn();
	}
	
	if ((rawLevel & ~((int)DDLogLevelVerbose)) != 0) {
		NSUInteger newLogLevel = rawLevel;
		newLogLevel &= ((int)DDLogLevelVerbose);
		NSMutableString *valString = [[NSMutableString alloc] init];
		
		LOGFLAGCHECK(DDLogLevelVerbose, valString, newLogLevel);
		LOGFLAGCHECK(DDLogLevelInfo, valString, newLogLevel);
		LOGFLAGCHECK(DDLogLevelWarning, valString, newLogLevel);
		LOGFLAGCHECK(DDLogLevelError, valString, newLogLevel);
		if (valString.length == 0) {
			[valString setString:@"LOG_LEVEL_OFF"];
		}
		
		LOG_MAYBE(YES, (ddLogLevelInternal | newLogLevel), DDLogFlagInfo, 0, nil, sel_getName(_cmd), @"[%@] WARN: The raw log level %lu is invalid! The new raw log level is %lu, or with the following flags: %@.", self, (unsigned long)rawLevel, (unsigned long)newLogLevel, valString);

		ddLogLevelInternal = newLogLevel;
	} else {
		NSMutableString *valStr = [[NSMutableString alloc] init];
		
		LOGFLAGCHECK(DDLogLevelVerbose, valStr, rawLevel);
		LOGFLAGCHECK(DDLogLevelInfo, valStr, rawLevel);
		LOGFLAGCHECK(DDLogLevelWarning, valStr, rawLevel);
		LOGFLAGCHECK(DDLogLevelError, valStr, rawLevel);
		if (valStr.length == 0) {
			[valStr setString:@"LOG_LEVEL_OFF"];
		}
		
		LOG_MAYBE(YES, (ddLogLevelInternal | rawLevel), DDLogFlagVerbose, 0, nil, sel_getName(_cmd), @"[%@] DEBUG: Current raw debug level has been set at %lu, or with the following flags: %@", [self class], (unsigned long)rawLevel, valStr);
		
		ddLogLevelInternal = rawLevel;
	}
#undef LOGFLAGCHECK
}

+ (void) setRawLogLevel:(NSUInteger)rawLevel
{
	[self setRawLogLevel:rawLevel withWarning:YES];
}

+ (void) setLogLevel:(SVGKLoggingLevel)newLevel
{
	switch (newLevel) {
		case SVGKLoggingMixed:
		{
			NSString *logName;
#define ARG(theArg) case theArg: \
logName = @#theArg; \
break
			switch ([self logLevel]) {
					ARG(SVGKLoggingOff);
					ARG(SVGKLoggingError);
					ARG(SVGKLoggingWarning);
					ARG(SVGKLoggingInfo);
					ARG(SVGKLoggingVerbose);
				default:
					ARG(SVGKLoggingMixed);
			}
			NSLog(@"[%@] WARN: SVGKLoggingMixed is an invalid value to set for the log level, staying at %@.", self, logName);
			static dispatch_once_t rawOnceInfoToken;
			dispatch_once(&rawOnceInfoToken, ^{
				NSLog(@"[%@] INFO: If you want a different value than what is available via SVGKLoggingLevel, look into setRawLogLevel.", self);
				NSLog(@"[%@] INFO: The raw log level values are based on the Lumberjack log levels. Look at their documentation for more info.", self);
			});
#undef ARG
		}
			break;
			
		case SVGKLoggingError:
			ddLogLevelInternal = DDLogLevelError;
			break;
			
		case SVGKLoggingInfo:
			ddLogLevelInternal = DDLogLevelInfo;
			break;
			
		case SVGKLoggingVerbose:
			ddLogLevelInternal = DDLogLevelVerbose;
			break;
			
		case SVGKLoggingWarning:
			ddLogLevelInternal = DDLogLevelWarning;
			break;
			
		default:
		case SVGKLoggingOff:
			ddLogLevelInternal = DDLogLevelOff;
			break;
	}
}

+ (void) enableLogging {
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

@end
