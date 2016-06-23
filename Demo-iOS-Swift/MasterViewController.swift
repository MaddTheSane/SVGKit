//
//  MasterViewController.swift
//  Demo-iOS-Swift
//
//  Created by C.W. Betts on 6/23/16.
//  Copyright © 2016 na. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

	var detailViewController: DetailViewController? = nil
	private var nameOfBrokenSVGToLoad: String?
	var sampleNames: [String] = {
		return [ "map-alaska-onlysimple", "g-element-applies-rotation", "groups-and-layers-test", "http://upload.wikimedia.org/wikipedia/commons/f/f9/BlankMap-Africa.svg", "shapes", "strokes", "transformations", "rounded-rects", "gradients","radialGradientTest", "PreserveAspectRatio", "australia_states_blank", "Reinel_compass_rose", "Monkey", "Blank_Map-Africa", "opacity01", "Note", "Note2x", "imageWithASinglePointPath", "Lion", "lingrad01", "Map", "CurvedDiamond", "Text", "text01", "tspan01", "Location_European_nation_states", "uk-only", "Europe_states_reduced", "Compass_rose_pale", "quad01", "cubic01", "rotated-and-skewed-text", "RainbowWing", "sakamura-default-fill-opacity-test", "StyleAttribute", "voies", "nil-demo-layered-imageview", "svg-with-explicit-width", "svg-with-explicit-width-large", "svg-with-explicit-width-large160x240", "BlankMap-World6-Equirectangular", "Coins", "parent-clip", "CSS", "imagetag-layered", "ImageAspectRatio", "test-stroke-dash-array", "radial-gradient-opacity", "radgrad01", "pattern01",
		         
		         // This file is still not fully supported, arc to is missing, but it has the evenodd in it
			"fillrule-evenodd"]
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.clearsSelectionOnViewWillAppear = false;
		self.preferredContentSize = CGSizeMake(320.0, 600.0)
	}

	override func viewWillAppear(animated: Bool) {
		self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
		super.viewWillAppear(animated)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Table View

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sampleNames.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cellIdentifier = "Cell"
		var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)

		if cell == nil {
			cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier);

		}
		cell!.textLabel!.text = sampleNames[indexPath.row]
		return cell!
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		if sampleNames[indexPath.row] ==  "Reinel_compass_rose" {
			NSLog("*****************\n*   WARNING\n*\n* The sample 'Reinel_compass_rose' is currently unsupported;\n* it is included in this build so that people working on it can test it and see if it works yet\n*\n*\n*****************");
			
			UIAlertView(title:"WARNING", message:"Reinel_compass_rose breaks SVGKit, it uses unsupported SVG commands; until we have added support for those commands, it's here as a test - but it WILL CRASH if you try to view it", delegate:self, cancelButtonTitle:"Cancel", otherButtonTitles:"OK, crash").show();
			
			nameOfBrokenSVGToLoad = sampleNames[indexPath.row]
			
			return;
		}
		
		if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
			if detailViewController == nil {
				detailViewController = DetailViewController(nibName:"iPhoneDetailViewController", bundle:nil)
			}
			navigationController?.pushViewController(detailViewController!, animated: true)
			detailViewController?.detailItem = sampleNames[indexPath.row]
		} else {
			detailViewController?.detailItem = sampleNames[indexPath.row]
		}

	}

	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}
}

extension MasterViewController: UIAlertViewDelegate {
	func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
		if buttonIndex == alertView.cancelButtonIndex {
			return;
		}
		
		if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
			if detailViewController == nil {
				detailViewController = DetailViewController(nibName: "iPhoneDetailViewController", bundle:nil)
			}
			navigationController?.pushViewController(detailViewController!, animated: true)
			detailViewController?.detailItem = nameOfBrokenSVGToLoad
		} else {
			detailViewController?.detailItem = nameOfBrokenSVGToLoad
		}
		
		self.nameOfBrokenSVGToLoad = nil;
	}
}

