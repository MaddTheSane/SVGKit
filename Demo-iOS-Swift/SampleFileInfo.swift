//
//  SampleFileInfo.swift
//  Demo-iOS
//
//  Created by C.W. Betts on 6/23/16.
//  Copyright © 2016 na. All rights reserved.
//

import Foundation
import SVGKit.SVGKSource
import SVGKit.SVGKSourceLocalFile
import SVGKit.SVGKSourceURL

final class SampleFileInfo: NSObject {
	let originalFileName: String?
	let originalURL: NSURL?
	var author: String?
	var licenseType: String?
	var name: String
	//@property(nonatomic,strong) NSString* author, * licenseType, * name;

	private init(fileName f: String?, URL s: NSURL?, name n: String) {
		originalFileName = f
		originalURL = s
		name = n
		super.init()
	}
	
	convenience init(filename f: String) {
		self.init(fileName: f, URL: nil, name: f)
	}
	
	convenience init(URL s: NSURL) {
		self.init(fileName: nil, URL: s, name: s.relativeString!)
	}
	
	convenience init(filename f: String?, URL s: NSURL?) {
		self.init(fileName: f, URL: s, name: f ?? s!.relativeString!)
	}
	
	var source: SVGKSource? {
		if originalFileName != nil {
			return sourceFromLocalFile
		} else if originalURL != nil {
			return sourceFromWeb
		}
		return nil
	}
	
	var sourceFromLocalFile: SVGKSource? {
		return SVGKSourceLocalFile.internalSourceAnywhereInBundleUsingName(originalFileName)
	}

	var sourceFromWeb: SVGKSource? {
		return SVGKSourceURL.sourceFromURL(originalURL)
	}
	
	var savedBitmapFilename: String! {
		if let origFilNam = originalFileName {
			return (origFilNam as NSString).stringByDeletingPathExtension
		} else if let origURL = originalURL, relStr = origURL.relativeString {
			return (relStr as NSString).stringByDeletingPathExtension
		}
		
		return nil
	}
}
