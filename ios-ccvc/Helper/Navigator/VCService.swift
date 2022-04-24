//
//  ViewControllerTask.swift
//  TetViet
//
//  Created by vinhdd on 12/14/18.
//  Copyright © 2018 Rikkeisoft. All rights reserved.
//

import UIKit
import SafariServices


class VCService {
    static func type<T: UIViewController>(_ type: T.Type) -> T {
        let nibName = VCService.nameOf(type: type)
        let vc = T(nibName: nibName, bundle: nil)
        return vc
        
    }
    
    static func nameOf<T: UIViewController>(type: T.Type) -> String {
        let typeName = NSStringFromClass(type)
        let returnName = typeName.split { $0 == "." }.map { String($0) }.last ?? typeName
        return returnName
    }
    
    static func present<T: UIViewController>(type: T.Type,
                                             fromController: UIViewController? = nil,
                                             prepare: ((_ vc: T) -> Void)? = nil,
                                             animated: Bool = true,
                                             completion: (() -> Void)? = nil) {
        let vc = VCService.type(type)
        prepare?(vc)
        let parentVC = fromController ?? UIViewController.topViewController()
        parentVC?.present(vc, animated: animated, completion: completion)
    }
    
    static func present(controller: UIViewController,
                        fromController: UIViewController? = nil,
                        prepare: ((_ vc: UIViewController) -> Void)? = nil,
                        animated: Bool = true,
                        completion: (() -> Void)? = nil) {
        prepare?(controller)
        let parentVC = fromController ?? UIViewController.topViewController()
        parentVC?.present(controller, animated: animated, completion: completion)
    }
    
    static func push<T: UIViewController>(type: T.Type,
                                          fromController: UIViewController? = nil,
                                          prepare: ((_ vc: T) -> Void)? = nil,
                                          animated: Bool = true,
                                          completion: (() -> Void)? = nil) {
        let vc = VCService.type(type)
        prepare?(vc)
        let parentVC = fromController ?? UIViewController.topViewController()
        parentVC?.navigationController?.pushViewController(vc, animated: animated)
        completion?()
    }
    
    static func push(controller: UIViewController,
                     fromController: UIViewController? = nil,
                     prepare: ((_ vc: UIViewController) -> Void)? = nil,
                     animated: Bool = true,
                     completion: (() -> Void)? = nil) {
        prepare?(controller)
        let parentVC = fromController ?? UIViewController.topViewController()
        parentVC?.navigationController?.pushViewController(controller, animated: animated)
        completion?()
    }
    
    static func dismiss(controller: UIViewController? = UIViewController.topViewController(), animated: Bool = true, completion: ((_ rootVC: UIViewController?) -> Void)? = nil) {
        controller?.view.endEditing(true)
        if let presentingViewController = controller?.presentingViewController {
            controller?.dismiss(animated: animated, completion: {
                completion?(presentingViewController)
            })
        } else {
            completion?(controller)
        }
    }
    

   
    
    static func pop(controller: UIViewController? = UIViewController.topViewController(), to: UIViewController, animated: Bool = true) {
        controller?.view.endEditing(true)
        controller?.navigationController?.popToViewController(to, animated: animated)
    }
    
        static func presentPopup(controller: UIViewController, to: UIViewController, transitionDelegate: UIViewControllerTransitioningDelegate?) {
        let nav = UINavigationController(rootViewController: to)
        nav.navigationBar.isHidden = true
        nav.modalPresentationStyle = .custom
        nav.transitioningDelegate = transitionDelegate
        
        controller.present(nav, animated: true, completion: nil)
    }
    
    static func presentSafari(urlString: String?,
                              fromController: UIViewController? = nil,
                              animated: Bool = true,
                              completion: (() -> Void)? = nil) {
        
        guard let url = URL(string: urlString ?? "") else { return }
        
        let svc = SFSafariViewController(url: url)
        
        let parentVC = fromController ?? UIViewController.topViewController()
        
        parentVC?.present(svc, animated: animated, completion: completion)
    }
}

