//
//  TinhHinhXuLyVanBanDenViewController.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 28/03/2022.
//

import UIKit
import Charts
class TinhHinhXuLyVanBanDenViewController: UIView {

    @IBOutlet var vanBanden : BasePieChart!
    @IBOutlet var vanBandi : BasePieChart!
    @IBOutlet var header : BackgroundItemView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setUpView()
 
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setUpView()
     
    }
    func setUpView(){
        header.diaLogSetting = [
            SettingData(title: "Thời gian", keys: [.homNay,.tuanNay,.thangNay,.namNay,.tuyChon], onChange: { value in
                print(value)
            })
        ]
        let data = [ChartData(title: "Chờ xử lý", value: 30, color: UIColor(hexString: "#5A8DEE"))
                    ,ChartData(title: "Đang xử lý", value: 7, color: UIColor(hexString: "#7966FF")),
                    ChartData(title: "Đã xử lý", value: 7, color: UIColor(hexString: "#28C76F")),
                    ChartData(title: "Chờ vào sổ", value: 14, color: UIColor(hexString: "#FF9F43"))]
        
        let dataVBDI = [ChartData(title: "Chờ trình ký", value: 30, color: UIColor(hexString: "#02C5DD"))
                    ,ChartData(title: "Chờ xử lý", value: 12, color: UIColor(hexString: "#5A8DEE")),
                    ChartData(title: "Đã xử lý", value: 7, color: UIColor(hexString: "#28C76F")),
                    ChartData(title: "Chờ cấp số", value: 14, color: UIColor(hexString: "#FF6D99")),
                        ChartData(title: "Chờ ban hành", value: 14, color: UIColor(hexString: "#374FC7"))]
        vanBanden.dataChart = data
        vanBandi.dataChart = dataVBDI
    }
    private func commonInit() {
        
        guard let view = UINib(nibName: "TinhHinhXuLyVanBanDenViewController", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        self.backgroundColor = .white
        self.addSubview(view)

    }
    
}
