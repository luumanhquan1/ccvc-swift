//
//  MenuItem.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 20/03/2022.
//

import Foundation
import UIKit
enum MenuItem{
    case hop
    case quanLyNhiemVu
    case hanhChinhCong
    case yKienNguoiDan
    case quanLyVanBan
    case baoChiMangXaHoi
    case ketNoi
    case chuyenPhamVi
    case caiDatGiaoDien
    case doiMatKhau
    case tienIch
    
    
    var getText: String{
        switch self {
        case .hop:
            return "Họp"
        case .quanLyNhiemVu:
            return "Quản lý nhiệm vụ"
        case .hanhChinhCong:
            return "Hành chính công"
        case .yKienNguoiDan:
            return "Ý kiến người dân"
        case .quanLyVanBan:
            return "Quản lý văn bản"
        case .baoChiMangXaHoi:
            return "Báo chí Mạng xã hội"
        case .ketNoi:
            return "Kết nối"
        case .chuyenPhamVi:
            return "Chuyển phạm vi"
        case .caiDatGiaoDien:
            return "Cài đặt giao diện"
        case .doiMatKhau:
            return "Đổi mật khẩu"
        case .tienIch:
            return "Tiện ích"
        }
    }
    var getUrlIcon: String{
        switch self {
        case .hop:
            return "ic_hop"
        case .quanLyNhiemVu:
            return "ic_quan_ly_nhiem_vu"
        case .hanhChinhCong:
            return "ic_hanh_chinh_cong"
        case .yKienNguoiDan:
            return "ic_y_kien_nguoi_dan"
        case .quanLyVanBan:
            return "ic_quan_ly_van_ban"
        case .baoChiMangXaHoi:
            return "ic_bao_chi_mang_xa_hoi"
        case .ketNoi:
            return "ic_ket_noi"
        case .chuyenPhamVi:
            return "ic_chuyen_pham_vi"
        case .caiDatGiaoDien:
            return "ic_cai_dat_giao_dien"
        case .doiMatKhau:
            return "ic_doi_mat_khau"
        case .tienIch:
            return "ic_tien_ich"
        }
    }
    var getScreen : UIViewController{
        switch self {
        case .hop:
            let item = HopViewController()
            item.modalPresentationStyle = .fullScreen
            return item
        case .quanLyNhiemVu:
            return HopViewController()
        case .hanhChinhCong:
            return HopViewController()
        case .yKienNguoiDan:
            return HopViewController()
        case .quanLyVanBan:
            return HopViewController()
        case .baoChiMangXaHoi:
            return HopViewController()
        case .ketNoi:
            return HopViewController()
        case .chuyenPhamVi:
            return HopViewController()
        case .caiDatGiaoDien:
            return HopViewController()
        case .doiMatKhau:
            return HopViewController()
        case .tienIch:
            return HopViewController()
        }
    }
}
