//
//  TapUIView.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 21/04/2022.
//

import Foundation
import UIKit
extension UIView {
    
    func addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self._handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
    }
    @objc func _handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
    
    var globalFrame: CGRect? {
            let rootView = UIApplication.shared.keyWindow?.rootViewController?.view
            return self.superview?.convert(self.frame, to: rootView)
        }
}
class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}
