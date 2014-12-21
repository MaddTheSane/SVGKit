//
//  ViewController.swift
//  SimpleSwiftDemo
//
//  Created by C.W. Betts on 10/11/14.
//  Copyright (c) 2014 na. All rights reserved.
//

import UIKit
import SVGKit

class ViewController: UIViewController {
	@IBOutlet var svgkView: SVGKFastImageView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		svgkView?.image = SVGKImage(named: "Coins")
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

