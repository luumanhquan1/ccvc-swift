//
//  UIImageView+Extension.swift
//  TetViet
//
//  Created by vinhdd on 12/14/18.
//  Copyright © 2018 Rikkeisoft. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadImage(urlString: String?,
                   placeholder: UIImage? = Constants.defaultImage,
                   showIndicator: Bool = false,
                   forceRefresh: Bool = false,
                   completion: ((_ image: UIImage?, _ error: Error?, _ url: URL?) -> Void)? = nil) {
        
        let url = URL(string: urlString ?? "")
        loadImage(url: url, placeholder: placeholder, showIndicator: showIndicator, forceRefresh: forceRefresh, completion: completion)
    }
    
    func loadImage(url: URL?,
                   placeholder: UIImage? = Constants.defaultImage,
                   showIndicator: Bool = false,
                   forceRefresh: Bool = false,
                   errorCount: Int = 0,
                   completion: ((_ image: UIImage?, _ error: Error?, _ url: URL?) -> Void)? = nil) {
        if showIndicator {
            self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        }
        sd_imageTransition = .fade
        var options: SDWebImageOptions = []
        if forceRefresh {
            options = [.refreshCached]
        }
        
        sd_setImage(with: url, placeholderImage: placeholder, options: options) { [weak self] (image, error, _, url) in
            guard let wSelf = self else { return }
            if error != nil {
                if errorCount >= 3 { // Requirement: Re-download image 3 times if load image fail
                    completion?(image, error, url)
                } else {
                    wSelf.loadImage(url: url, placeholder: placeholder, showIndicator: showIndicator, forceRefresh: forceRefresh, errorCount: errorCount + 1, completion: completion)
                }
            } else {
                completion?(image, error, url)
            }
        }
    }
    
    func cancelDownloadingImage() {
        sd_cancelCurrentImageLoad()
    }
    
//    func set(color: UIColor) {
//        image = image?.renderTemplate()
//        tintColor = color
//    }
    
//    func renderOriginal() {
//        image = image?.renderOriginal()
//    }
    
//    func renderTemplate() {
//        image = image?.renderTemplate()
//    }
//
   
    
    
}
