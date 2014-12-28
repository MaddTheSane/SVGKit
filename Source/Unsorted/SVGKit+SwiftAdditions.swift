//
//  SVGKit+SwiftAdditions.swift
//  SVGKit
//
//  Created by C.W. Betts on 10/14/14.
//  Copyright (c) 2014 C.W. Betts. All rights reserved.
//

import Foundation

extension SVGKNodeList: SequenceType {
	public func generate() -> IndexingGenerator<[SVGKNode]> {
		return (internalArray as NSArray as [SVGKNode]).generate()
	}
}

extension SVGKImage {
	public class var cacheEnabled: Bool {
		get {
			return isCacheEnabled()
		}
		set {
			if cacheEnabled == newValue {
				return
			}
			if newValue {
				enableCache()
			} else {
				disableCache()
			}
		}
	}
}

#if os(OSX)
extension SVGKImageRep {
	
}
#endif
