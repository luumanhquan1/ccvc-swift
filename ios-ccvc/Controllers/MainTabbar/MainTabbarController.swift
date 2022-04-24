//
//  MainTabbarController.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 19/03/2022.
//

import UIKit
//var tabbarItem : [TabbarTy]
class MainTabbarController: UITabBarController {
    var tabbarScreen : [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController.
//        self.hidesBottomBarWhenPushed = true
    
        configTabbar()
        setupViewControllers()
        userDidLoggedOut()
    }
    private func configTabbar() {
        self.tabBar.barTintColor = UIColor.white
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width:self.tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = UIColor(hexString: "#F2F2F2")
        self.tabBar.addSubview(lineView)
    }
    func setupViewControllers(){
        var listScreen : [UINavigationController] = []
        tabbarList().forEach {
            listScreen.append(generateNavigator(type: $0.self))
        }
        viewControllers = listScreen
    }
    public func userDidLoggedOut() {
        self.selectedIndex = 0
    }
    
}
enum TabbarType {
    case home
    case baoCao
    case lichLamViec
    case tuongTacNoiBo
    case menu
    
    var getTitle : String{
        switch self {
        case .home:
            return "Trang chủ"
        case .baoCao:
            return "Báo cáo"
        case .lichLamViec:
            return "Lịch làm việc"
        case .tuongTacNoiBo:
            return "Tương tác nội bộ"
        case .menu:
            return "Menu"
        }
    }
    var getIcon : String{
        switch self {
        case .home:
            return "ic_home"
        case .baoCao:
            return "ic_chart"
        case .lichLamViec:
            return "ic_lich"
        case .tuongTacNoiBo:
            return "ic_message"
        case .menu:
            return "ic_menu"
        }
    }
    var getSceen : UIViewController{
        switch self {
        case .home:
             return HomeViewController()
        case .baoCao:
            return BaoCaoViewController()
        case .lichLamViec:
            return LichlamViecViewController()
        case .tuongTacNoiBo:
            return TuongTacnoiBoViewController()
        case .menu:
            return MenuViewController()
        }
        
    }
    
}

extension MainTabbarController{
    
 
    func generateNavigator(type:TabbarType) -> UINavigationController{
        let nav = UINavigationController(rootViewController: type.getSceen)
    
        nav.tabBarItem.title = type.getTitle
        nav.tabBarItem.image = UIImage(named: type.getIcon)
        return nav
    }
}
extension MainTabbarController{
    func tabbarList()  -> [TabbarType]{
        return [
            TabbarType.home,
            TabbarType.baoCao,
            TabbarType.lichLamViec,
            TabbarType.tuongTacNoiBo,
            TabbarType.menu
        
        ]
    }
}
