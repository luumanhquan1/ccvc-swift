//
//  HomeViewController.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 20/03/2022.
//

import UIKit
import SwiftGifOrigin
class HomeViewController: UIViewController {

    @IBOutlet var infoUser : InfoUserHeaderView!
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var appbar:UIView!
    @IBOutlet var itemsView : UIStackView!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.isScrollEnabled = false

        infoUser.backgroundColor = UIColor.clear
           refreshControl.addTarget(self, action: #selector(doSomething), for: .valueChanged)
        self.navigationController?.isNavigationBarHidden = true
        scrollView.refreshControl = refreshControl
        let viewitem = TinhHinhXuLyVanBanDenViewController()
        itemsView.addArrangedSubview(viewitem)
        let vanBanItem = VanBanViewController()
        itemsView.addArrangedSubview(vanBanItem)
        itemsView.addArrangedSubview(VanBanViewController())
        
        
    }
    @objc func doSomething(refreshControl: UIRefreshControl) {
        print("Hello World!")

        // somewhere in your code you might need to call:
        refreshControl.endRefreshing()
    }


//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
////        if scrollView.contentOffset.y < 0{
////            scrollView.refreshControl = refreshControl
////            scrollView.contentOffset.y = 0
////        }
////        print("\(scrollView.contentOffset.y)")
//    }

}
