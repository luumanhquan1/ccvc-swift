//
//  VanBanModel.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 19/04/2022.
//

class VanBanModel{
    let tieuDe:String
    let soKyHieu:String
    let noiGui:String
    let status:String
init(tieuDe:String?,soKyHieu:String?,noiGui:String?,status:String) {
    self.tieuDe = tieuDe ?? ""
    self.noiGui = noiGui ?? ""
    self.soKyHieu = soKyHieu ?? ""
    self.status = status
    }
}
