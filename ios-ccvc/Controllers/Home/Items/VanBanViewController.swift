//
//  VanBanViewController.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 11/04/2022.
//

import UIKit
import LoadableViews

class VanBanViewController: LoadableView {
    
    @IBOutlet var cellContent : UIStackView!
    @IBOutlet var selectKey : SelectKeyRowView!
    @IBOutlet var header : BackgroundItemView!
    override var nibName: String{
        return "VanBanViewController"
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    func setUpView(){
        header.diaLogSetting = [
            SettingData(title: "Thời gian", keys: [.homNay,.tuanNay,.thangNay,.namNay,.tuyChon], onChange: { value in
                print(value)
            })
        ]
        selectKey.listSelectData = [.choVaoSo,.choXuLyVBDen,.choChoYKienVBDen,.choTrinhKy,.choXuLyVbDi,.choCapSo,.choBanHanh]
        selectKey.onChange = {data in
            print(data)
        }
        FakeData.list.forEach({value in
            let info = InfoItemCell()
            info.tieuDe = value.tieuDe
            info.data = [
                DataInfo(icon: "ic_so_ky_hieu", key: "Số/ký hiệu", value: value.soKyHieu),
                DataInfo(icon: "ic_dia_chi", key: "Nơi gửi", value: value.noiGui)]
            info.statusTxt = value.status
            info.statusColor = UIColor(hexString: "#28C76F")
            cellContent.addArrangedSubview(info)
        })
    }

}
class FakeData{
    static var list = [
    VanBanModel(tieuDe: "Công văn 2005/KHPTDL chờ phê duyệt", soKyHieu: "VPCP-TTĐT", noiGui: "Ban ATGT Tiền Giang - tỉnh Tiền", status: "Hoàn thành"),
    VanBanModel(tieuDe: "Công văn 2005/KHPTDL chờ phê duyệt", soKyHieu: "VPCP-TTĐT", noiGui: "Ban ATGT Tiền Giang - tỉnh Tiền", status: "Hoàn thành"),  VanBanModel(tieuDe: "Công văn 2005/KHPTDL chờ phê duyệt", soKyHieu: "VPCP-TTĐT", noiGui: "Ban ATGT Tiền Giang - tỉnh Tiền", status: "Hoàn thành"),  VanBanModel(tieuDe: "Công văn 2005/KHPTDL chờ phê duyệt", soKyHieu: "VPCP-TTĐT", noiGui: "Ban ATGT Tiền Giang - tỉnh Tiền", status: "Hoàn thành"),  VanBanModel(tieuDe: "Công văn 2005/KHPTDL chờ phê duyệt", soKyHieu: "VPCP-TTĐT", noiGui: "Ban ATGT Tiền Giang - tỉnh Tiền", status: "Hoàn thành"),  VanBanModel(tieuDe: "Công văn 2005/KHPTDL chờ phê duyệt", soKyHieu: "VPCP-TTĐT", noiGui: "Ban ATGT Tiền Giang - tỉnh Tiền", status: "Hoàn thành"),  VanBanModel(tieuDe: "Công văn 2005/KHPTDL chờ phê duyệt", soKyHieu: "VPCP-TTĐT", noiGui: "Ban ATGT Tiền Giang - tỉnh Tiền", status: "Hoàn thành"),  VanBanModel(tieuDe: "Công văn 2005/KHPTDL chờ phê duyệt", soKyHieu: "VPCP-TTĐT", noiGui: "Ban ATGT Tiền Giang - tỉnh Tiền", status: "Hoàn thành")
    
    ]
}
