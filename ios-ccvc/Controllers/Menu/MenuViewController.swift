//
//  MenuViewController.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 20/03/2022.
//

import UIKit

let listChucNang:[MenuItem] = [
    .hop,
    .quanLyNhiemVu,
    .hanhChinhCong,
    .yKienNguoiDan,
    .quanLyVanBan,
    .baoChiMangXaHoi,
    .ketNoi,
    .tienIch
]
let listAccount:[MenuItem]=[
    .chuyenPhamVi,
    .caiDatGiaoDien,
    .doiMatKhau
]
class MenuViewController: UIViewController {
//    @IBOutlet var stackChucNang :UIStackView!
    
    @IBOutlet var viewChucNang :UIStackView!
    @IBOutlet var chucNangAccount : UIStackView!
    @IBOutlet var avatarUser : UIImageView!
    @IBOutlet var nameUser :UILabel!
    @IBOutlet var chucVuUser : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


    setUpView()
    }


    func setUpView(){
        
        self.navigationController?.isNavigationBarHidden = true
//        avatarUser.
        nameUser.text = "Lê Sĩ Lâm"
        chucVuUser.text = "Chủ tịch UBND tỉnh"
        avatarUser.loadImage(url: URL(string: "https://sohanews.sohacdn.com/k:2015/ngoc-1428232679645/10-buc-anh-de-doi-cua-ngoc-trinh.jpg"))
        avatarUser.layer.cornerRadius = (avatarUser.frame.size.width)/2
        avatarUser.clipsToBounds = true
        avatarUser.layer.borderColor = UIColor(hexString: "#FFFFFF").withAlphaComponent(0.3).cgColor
        avatarUser.layer.borderWidth = 6
//
//        avatarUser.sizeToFit()
        addChucNang()
        addChucNangAccount()
    }

}
extension MenuViewController{
    func addChucNang(){
        listChucNang.forEach({
            let item = MenuCellViewController()
            item.menuItem = $0.self
            item.onTap = {
                if let key = $0.self{
//                    key.getScreen.hidesBottomBarWhenPushed = true
                    let item = key.getScreen
                    item.hidesBottomBarWhenPushed = true
                    VCService.push(controller: item)
                }
            }
            viewChucNang.addArrangedSubview(item)
        })
    }
    func addChucNangAccount(){
        listAccount.forEach({
            let item = MenuCellViewController()
            item.menuItem = $0
            item.onTap = {
                if let key = $0.self{
                    print("\(key.getText)")
                }
            }
            chucNangAccount.addArrangedSubview(item)
        })
    }
}
