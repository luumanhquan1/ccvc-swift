//
//  InfoUserHeaderView.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 27/03/2022.
//

import UIKit

class InfoUserHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }


    private func commonInit() {
        guard let view = UINib(nibName: "InfoUserHeaderView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        self.backgroundColor = .clear
    }


}
