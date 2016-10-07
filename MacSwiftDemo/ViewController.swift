//
//  ViewController.swift
//  MacSwiftDemo
//
//  Created by C.W. Betts on 10/18/14.
//  Copyright (c) 2014 C.W. Betts. All rights reserved.
//

import Cocoa
import SVGKit

class ViewController: NSViewController {

    @IBOutlet weak var layeredImage: SVGKLayeredImageView?
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		layeredImage?.image = SVGKImage(named: "Coins")
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
}

