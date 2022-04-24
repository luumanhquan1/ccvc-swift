//
//  MequeenView.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 27/03/2022.
//

import UIKit
var khanCap : [String] = ["Cập nhật mới nhất tình hình dịch bệnh COVID-19 tại Đồng Nai","Đồng Nai sẽ hỗ trợ gần 8.00 công dân về quê tỉnh Phú Yên trong chiều ngày 25.11","Sáng 12-11, thêm 247 ca mắc trong cộng đồng; hơn 95 ngàn trẻ từ 15 đến dưới 18 tuổi đã tiêm vắc xin COVID-19",
                          "Ngày 11-11: Có 8.162 ca mắc COVID-19 tại 56 địa phương, TP.HCM nhiều nhất với gần 1.200 ca"

]
class MequeenView: UIView {
    @IBOutlet var iconKhanCap:UIImageView!
    @IBOutlet var merquee:UIStackView!
    var initDouble:CGFloat = SceneDelegate.window?.frame.size.width ?? 0;
    var timer = Timer()
    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
        setUpView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setUpView()

    }
    func setUpView(){
       setOffset(offset: initDouble)
        possitedRun()
        iconKhanCap.loadGif(name:"gif_thong_bao_khan")
     addSubViewMequeen()
    }
    
    private func commonInit() {
        guard let view = UINib(nibName: "MequeenView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        
    }


}
extension MequeenView{
    func possitedRun(){
      timer =  Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .tracking) 
    }
    @objc func timerAction() {
        initDouble-=1;
        if merquee.frame.size.width < SceneDelegate.window?.frame.size.width ?? 0{
            merquee.addArrangedSubview(addMequee())
        }
    setOffset(offset: initDouble)
        
       }
    func setOffset(offset : CGFloat){
        merquee.layoutMargins = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: 0)
        merquee.isLayoutMarginsRelativeArrangement = true
    }
}
extension MequeenView {
    func addSubViewMequeen(){
    
        merquee.addArrangedSubview(addMequee())
        merquee.addArrangedSubview(addMequee())
    }
    func addMequee() -> UIStackView{
        let stackView = UIStackView()
        stackView.spacing = 12
        for index in 0..<khanCap.count {
            let item = MequeenCell()
            item.colorM = index%2==0 ? UIColor(hexString: "#EB5757"):UIColor(hexString: "#3D5586")
            item.labelTitle = khanCap[index]
            stackView.addArrangedSubview(item)
//            stackView2.addArrangedSubview(item)

        }
        return stackView
    }
}
