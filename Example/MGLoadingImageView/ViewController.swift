//
//  ViewController.swift
//  MGLoadingImageView
//
//  Created by mikegilroy on 02/23/2017.
//  Copyright (c) 2017 mikegilroy. All rights reserved.
//

import UIKit
import MGLoadingImageView


class ViewController: UIViewController {

	// MARK: - View Outlets
	
	@IBOutlet weak var demoImageView: MGLoadingImageView!
	@IBOutlet weak var loadImageButton: UIButton!
	@IBOutlet weak var resetButton: UIButton!
	
	
	// MARK: - VC Events
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	
	// MARK: - View Actions
	
	@IBAction func resetButtonTapped(_ sender: Any) {
		demoImageView.resetToPlaceHolder()
	}
	
	@IBAction func startLoadingTapped(_ sender: Any) {
		// Only demo app applicable
		disableDemoButtons()
		demoImageView.resetToPlaceHolder()
		
		// Call startLoading() in MGLoadingImageView to start animating loading spinner
		demoImageView.startLoading()
		
		loadFakeLargeImage { [weak self] (image) in
			DispatchQueue.main.async {
				
				// When loading complete call finishedLoading on MGLoadingImageView and pass in your loaded image
				// Note: Make sure to call this on the main thread
				self?.demoImageView.stopLoading(withImage: image)
				

				// Only demo app applicable
				self?.enableDemoButtons()
			}
		}
	}
	
	func loadFakeLargeImage(completion: @escaping (_ image: UIImage?) -> Void) {
		DispatchQueue.global(qos: .background).async {
			sleep(3)
			completion(UIImage(named: "sailaway"))
		}
	}


	// MARK: - Demo Setup - Only demo app applicable
	
	func enableDemoButtons() {
		loadImageButton.setTitle("Load Image", for: .normal)
		resetButton.isHidden = false
		loadImageButton.isEnabled = true
	}
	
	func disableDemoButtons() {
		loadImageButton.isEnabled = false
		loadImageButton.setTitle("Loading...", for: .normal)
		resetButton.isHidden = true
		
	}

}

