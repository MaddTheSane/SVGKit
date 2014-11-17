/**
 Makes the writable properties all package-private, effectively
 */
#import "SVGKNode.h"

@interface SVGKNode()
@property(nonatomic,copy,readwrite) NSString* nodeName;
@property(nonatomic,copy,readwrite) NSString* nodeValue;

@property(nonatomic,readwrite) DOMNodeType nodeType;
@property(nonatomic,weak,readwrite) SVGKNode* parentNode;
@property(nonatomic,strong,readwrite) SVGKNodeList* childNodes;
@property(nonatomic,strong,readwrite) SVGKNamedNodeMap* attributes;

@property(nonatomic,weak,readwrite) SVGKDocument* ownerDocument;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readwrite) NSString* namespaceURI;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readwrite) NSString* prefix;

// Introduced in DOM Level 2:
@property(nonatomic,strong,readwrite) NSString* localName;

@end
