//
//  UIViewController+Extension.swift
//  iOS Structure MVC
//
//  Created by vinhdd on 10/9/18.
//  Copyright © 2018 vinhdd. All rights reserved.
//

import AVKit
import UIKit

protocol XibViewController {
    static var name: String { get }
    static func create() -> Self
}

extension XibViewController where Self: UIViewController {
    static var name: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
    static func create() -> Self {
        return self.init(nibName: Self.name, bundle: nil)
    }
    
    static func present(from: UIViewController? = top(),
                        animated: Bool = true,
                        prepare: ((_ vc: Self) -> Void)? = nil,
                        completion: (() -> Void)? = nil) {
        guard let parentVC = from else { return }
        let targetVC = create()
        prepare?(targetVC)
        parentVC.present(targetVC, animated: animated, completion: completion)
    }
    
    static func push(from: UIViewController? = top(),
                     animated: Bool = true,
                     prepare: ((_ vc: Self) -> Void)? = nil,
                     completion: (() -> Void)? = nil) {
        guard let parentVC = from else { return }
        let targetVC = create()
        prepare?(targetVC)
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        parentVC.navigationController?.pushViewController(targetVC, animated: animated)
        CATransaction.commit()
    }
}

extension UIViewController: XibViewController { }

extension UINavigationController
{
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        if let lastVC = self.viewControllers.last
        {
            return lastVC.preferredStatusBarStyle
        }

        return .default
    }
}


extension UIViewController {
    
    var name: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
    
    var isModal: Bool {
        if let navController = self.navigationController, navController.viewControllers.first != self {
            return false
        }
        if presentingViewController != nil {
            return true
        }
        if navigationController?.presentingViewController?.presentedViewController == self.navigationController {
            return true
        }
        if tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
    }
    
    var isVisible: Bool {
        return self.isViewLoaded && self.view.window != nil
    }
    
    class func top(controller: UIViewController? = SceneDelegate.window?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return top(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return top(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return top(controller: presented)
        }
        return controller
    }
    
    func dismissToRoot(controller: UIViewController? = UIViewController.top(),
                       animated: Bool = true,
                       completion: ((_ rootVC: UIViewController?) -> Void)? = nil) {
        guard let getController = controller else {
            completion?(nil)
            return
        }
        if let prevVC = getController.presentingViewController {
            if prevVC.isModal && prevVC.presentingViewController != nil {
                dismissToRoot(controller: prevVC, animated: animated, completion: completion)
            } else {
                getController.dismiss(animated: animated, completion: {
                    completion?(prevVC)
                })
            }
        } else {
            completion?(getController)
        }
    }
    
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func pop(to: UIViewController, animated: Bool = true) {
        navigationController?.popToViewController(to, animated: animated)
    }
    
    
    @objc func dismissAlertController()
    {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UIViewController {
    
    @available(iOS 11.0, *)
    public var hideKeyBoardWhenTouchOutSide : Bool {
        get {
            return view.gestureRecognizers?.filter({ $0.name == "tapHideKeyBoard" }) == nil ? false : true
        }
        set {
            guard let gestureRecognizers = view.gestureRecognizers,
                let tapHideKeyBoard = gestureRecognizers.filter({ $0.name == "tapHideKeyBoard" }).first else {
                    if newValue {
                        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
                        tap.name = "tapHideKeyBoard"
                        tap.cancelsTouchesInView = false
                        view.addGestureRecognizer(tap)
                    }
                    return
            }
            if !newValue {
                view.removeGestureRecognizer(tapHideKeyBoard)
            }
        }
    }
    
    @objc func hideKeyBoard() {
        view.endEditing(true)
    }
 
    
    
    class func topViewController(controller: UIViewController? = SceneDelegate.window?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        return controller
    }
    
    static func topControllerIs<T: UIViewController>(_ type: T.Type) -> Bool {
        guard let topVC = topViewController() else { return false }
        return topVC.isKind(of: type)
    }
    
}

extension UIViewController {
    
   
    
}

extension UIViewController {
    
    public func presentFullscreen(_ viewControllerToPresent: UIViewController, animated: Bool = true) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: animated)
    }
    
}

extension UIViewController: UIDocumentInteractionControllerDelegate {
    public func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
}






extension UIViewController {
    func addViewController(vc: UIViewController, viewBase: UIView){
        vc.willMove(toParent: self)
        self.addChild(vc)
        viewBase.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.frame = CGRect(x: 0, y: 0, width: viewBase.bounds.width, height: viewBase.bounds.height)
    }
    
    func showDialog(height: CGFloat = UIScreen.main.bounds.height) {
        guard let parentVC = UIViewController.top() else { return }
        let nav = UINavigationController(rootViewController: self)
        nav.modalPresentationStyle = .custom
        nav.navigationBar.isHidden = true
        nav.interactivePopGestureRecognizer?.isEnabled = false
        let delegate = ModalTransitioningDelegate(height)
        nav.transitioningDelegate = delegate
        parentVC.present(nav, animated: true, completion: nil)
    }
    
    func destroy(animated: Bool = false)  {
        if let nav = self.navigationController, nav.children.count > 1 {
            nav.popViewController(animated: animated)
        } else {
            dismiss(animated: animated, completion: nil)
        }
    }
}

extension UIViewController {

    var topbarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (navigationController?.navigationBar.frame.height ?? 0.0)
            return topBarHeight
        }
    }
}


class ModalTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    let height: CGFloat
    init( _ height: CGFloat) {
        self.height = height
        super.init()
    }
    
}
