//
//  CustomNavigatorBar.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 20/03/2022.
//

import UIKit


class CustomNavigatorBar: UIView {

    @IBOutlet var labelTitle: UILabel!
    @IBInspectable var title :String?{
        didSet{
            labelTitle.text = title
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()

    }
    private func commonInit() {
        guard let view = UINib(nibName: "CustomNavigatorBar", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        self.backgroundColor = .clear
    }


}
