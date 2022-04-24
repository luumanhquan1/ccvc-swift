//
//  InfoUserHeaderView.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 27/03/2022.
//

import UIKit

class InfoUserHeaderView: UIView {
    private var shadowLayer: CAShapeLayer!
    @IBOutlet var viewContent :UIView!
    @IBOutlet var nameUser :UILabel!
    @IBOutlet var chucVuUser:UILabel!
    @IBOutlet var time:UILabel!
    @IBOutlet var lichDuongTxt:UILabel!
    @IBOutlet var lichAmTxt:UILabel!
    @IBOutlet var avatar:UIImageView!
    
    var timer = Timer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        timeRun()
        commonInit()
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        timeRun()
        commonInit()
        setUpView()
    }

    func setUpView(){
        let currentDateTime = Date()
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        time.text = df.string(from: currentDateTime)
    
        viewContent.layer.cornerRadius = 8
        avatar.loadImage(url: URL(string: "https://sohanews.sohacdn.com/k:2015/ngoc-1428232679645/10-buc-anh-de-doi-cua-ngoc-trinh.jpg"))
        avatar.layer.cornerRadius = (avatar.frame.size.width)/2
        avatar.clipsToBounds = true
    }

    private func commonInit() {
        guard let view = UINib(nibName: "InfoUserHeaderView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        
    }


}
extension InfoUserHeaderView{
    
    func timeRun(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .tracking)
    }
    @objc func timerAction() {
        let currentDateTime = Date()
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        time.text = df.string(from: currentDateTime)
    
       }
}
