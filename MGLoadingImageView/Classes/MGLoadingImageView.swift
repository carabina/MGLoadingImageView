//
//  MGLoadingImageView.swift
//  Pods
//
//  Created by Mike Gilroy on 23/02/2017.
//
//

import Foundation
import UIKit


@IBDesignable public class MGLoadingImageView: UIImageView {

	// MARK: - Properties
	
	@IBInspectable public var placeholderImage: UIImage? {
		willSet (newValue) {
			self.image = newValue
		}
	}
	
	public var isLoading: Bool {
		return self.activityIndicator.isAnimating
	}
	public var activityIndicatorStyle: UIActivityIndicatorViewStyle = .whiteLarge {
		willSet(newStyle) {
			activityIndicator.activityIndicatorViewStyle = newStyle
		}
	}
	private let activityIndicator: UIActivityIndicatorView
	
	
	// MARK: - Initializers
	
	init(placeholderImage: UIImage? = nil, activityIndicatorStyle: UIActivityIndicatorViewStyle) {
		self.placeholderImage = placeholderImage
		self.activityIndicatorStyle = activityIndicatorStyle
		self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: activityIndicatorStyle)
		super.init(image: placeholderImage)
	}
	
	init(placeholderImage: UIImage? = nil, activityIndicatorStyle: UIActivityIndicatorViewStyle, frame: CGRect) {
		self.placeholderImage = placeholderImage
		self.activityIndicatorStyle = activityIndicatorStyle
		self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: activityIndicatorStyle)
		super.init(frame: frame)
		self.image = placeholderImage
	}
	
	override init(frame: CGRect) {
		self.placeholderImage = nil
		self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: activityIndicatorStyle)
		super.init(frame: frame)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: activityIndicatorStyle)
		super.init(coder: aDecoder)
		self.image = self.placeholderImage
	}
	

	// MARK: - View Setup
	
	override public func layoutSubviews() {
		super.layoutSubviews()
		self.addSubview(activityIndicator)
		activityIndicator.center = CGPoint(x: (self.frame.width/2), y: (self.frame.height/2))
		activityIndicator.hidesWhenStopped = true
	}
	
	
	/// Resets the image view to it's initial state with loading spinner inactive and the image set as the placeholder image
	public func resetToPlaceHolder() {
		self.image = self.placeholderImage
		self.activityIndicator.stopAnimating()
	}
	
	public func startLoading() {
		self.activityIndicator.startAnimating()
		self.activityIndicator.isHidden = false
	}
	
	public func stopLoading(withImage image: UIImage?) {
		if let image = image {
			self.image = image
		}
		self.activityIndicator.stopAnimating()
	}
}
