//
//  MequeenCell.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 27/03/2022.
//

import UIKit

class MequeenCell: UIView {
    @IBOutlet var viewDot:UIView!
    @IBOutlet var text :UILabel!
    
    
    var labelTitle:String?{
        didSet{
            if let labelTxt = labelTitle{
                text.text = labelTxt
            }
        }
    }
    var colorM:UIColor?{
        didSet{
            if let colorTxt = colorM{
                text.textColor = colorTxt
                viewDot.backgroundColor = colorTxt
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setUpView()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setUpView()

    }
    
    func setUpView(){
        viewDot.layer.cornerRadius = viewDot.frame.width/2
    }
    
    private func commonInit() {
        guard let view = UINib(nibName: "MequeenCell", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        
    }
}
