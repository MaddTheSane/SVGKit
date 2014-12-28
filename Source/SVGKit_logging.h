
#ifndef IS_ALSO_LUMBERJACK_LOG_LEVEL
#define IS_ALSO_LUMBERJACK_LOG_LEVEL 1
#endif

#if IS_ALSO_LUMBERJACK_LOG_LEVEL
extern NSUInteger ddLogLevel CA_HIDDEN;
#else
NSUInteger SVGCurrentLogLevel() CA_HIDDEN;
#define ddLogLevel SVGCurrentLogLevel()
#endif



