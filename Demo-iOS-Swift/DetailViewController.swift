//
//  DetailViewController.swift
//  Demo-iOS-Swift
//
//  Created by C.W. Betts on 6/23/16.
//  Copyright © 2016 na. All rights reserved.
//

import UIKit
import SVGKit

private let kTimeIntervalForLastReRenderOfSVGFromMemory = "timeIntervalForLastReRenderOfSVGFromMemory"

private class ImageLoadingOptions {
	var requiresLayeredImageView: Bool = false
	var overrideImageSize: CGSize
	var overrideImageRenderScale: CGFloat
	var localFileSource: SVGKSourceLocalFile?

	init(source: SVGKSource) {
		localFileSource = source as? SVGKSourceLocalFile
		
		overrideImageRenderScale = 1
		overrideImageSize = CGSize.zero
	}
}

class DetailViewController: UIViewController {

	var sourceOfCurrentDocument: SVGKSource!
	var exportText: UITextView!
	var exportLog: NSMutableString!
	
	@IBOutlet var toolbar: UIToolbar!
	@IBOutlet var scrollViewForSVG: UIScrollView!
	@IBOutlet var contentView: SVGKImageView!
	@IBOutlet var viewActivityIndicator: UIActivityIndicatorView!
	@IBOutlet var progressLoading: UIProgressView!
	@IBOutlet var subViewLoadingPopup: UIView!

	@IBOutlet var labelParseTime: UILabel!

	var detailItem: AnyObject? {
		didSet {
		    // Update the view.
		    self.configureView()
		}
	}

	func configureView() {
		// Update the user interface for the detail item.
		if let detail = self.detailItem {
		    //if let label = self.detailDescriptionLabel {
		    //    label.text = detail.description
		    //}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func animate(sender: AnyObject!) {
		
	}
	
	@IBAction func showHideBorder(sender: AnyObject!) {
		
	}
}

/*
UIPopoverControllerDelegate, UISplitViewControllerDelegate,
#if V_1_COMPATIBILITY_COMPILE_CALAYEREXPORTER_CLASS
CALayerExporterDelegate,
#endif
UIScrollViewDelegate*/

extension DetailViewController: UIPopoverControllerDelegate {
	
}

extension DetailViewController: UISplitViewControllerDelegate {
	
}

extension DetailViewController: UIScrollViewDelegate {
	
}
