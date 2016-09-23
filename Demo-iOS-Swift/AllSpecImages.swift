//
//  AllSpecImages.swift
//  Demo-iOS
//
//  Created by C.W. Betts on 6/23/16.
//  Copyright © 2016 na. All rights reserved.
//

import UIKit
import SVGKit.SVGKSourceLocalFile

class AllSpecImages: UIViewController {
	@IBOutlet var collectionView: UICollectionView?
	var pathInBundleToSVGSpecTestSuiteFolder: String?
	
	private var xcodeVirtualFolderPath: String?
	private var svgFileNames: [String]?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if svgFileNames == nil {
			xcodeVirtualFolderPath = NSBundle.mainBundle().resourceURL!.URLByAppendingPathComponent(pathInBundleToSVGSpecTestSuiteFolder!).path!
			
			svgFileNames = try! NSFileManager.defaultManager().contentsOfDirectoryAtPath((xcodeVirtualFolderPath! as NSString).stringByAppendingPathComponent("svg"))
		}
	}
	
	
	func sectionAtIndex(index: Int) -> [String] {
		return svgFileNames!
	}
	
	func filenameAtIndexPath(indexPath: NSIndexPath) -> String {
		let section = sectionAtIndex(indexPath.section)
		let item = section[indexPath.row]
		return item
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let nextVC = segue.destinationViewController as? DetailViewController {
			let filename = filenameAtIndexPath(collectionView!.indexPathsForSelectedItems()![0])
			nextVC.detailItem = SVGKSourceLocalFile.sourceFromFilename(((xcodeVirtualFolderPath! as NSString).stringByAppendingPathComponent("svg") as NSString).stringByAppendingPathComponent(filename))
		}
	}
}

//MARK: - UICollectionView

extension AllSpecImages: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
		
		let filename = filenameAtIndexPath(indexPath)
		
		let l = cell.viewWithTag(1) as? UILabel
		l?.text = filename;
		
		let iv = cell.viewWithTag(2) as? UIImageView
		/** Xcode 3, 4, 5 and even version 6 -- all SUCK. "Groups", "Folders", and "Folder References" are all STILL broken by default
		
		Spec adds hundreds of files, and Xcode deletes the folders. So must use folder-references. But Apple folder-references STILL break Apple's UIImage, so we have to specify manual path.
		*/
		let fullPathImageFileName = ((xcodeVirtualFolderPath! as NSString).stringByAppendingPathComponent("png") as NSString).stringByAppendingPathComponent(filename)
		
		if let savedImage = UIImage(named: (fullPathImageFileName as NSString).stringByDeletingPathExtension) {
			iv?.image = savedImage
		} else {
			iv?.image = nil
		}
		
		return cell;
	}
	
	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return sectionAtIndex(section).count
	}
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		performSegueWithIdentifier("ViewSVG", sender: nil)
	}
}
