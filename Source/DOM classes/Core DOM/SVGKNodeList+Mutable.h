/**
 Makes the writable properties all package-private, effectively
 */

#import "SVGKNodeList.h"

@interface SVGKNodeList()

@property(nonatomic,strong) NSMutableArray<SVGKNode*>* internalArray;

@end
