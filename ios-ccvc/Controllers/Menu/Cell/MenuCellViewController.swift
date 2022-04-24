//
//  MenuCellViewController.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 20/03/2022.
//

import UIKit

class MenuCellViewController: UIView {
    
    @IBOutlet var imageMenu : UIImageView!
    @IBOutlet var textLabel : UILabel!
    var onTap : ((MenuItem?) -> Void)?
    var menuItem:MenuItem?{
        didSet{
            if let menuItem = menuItem {
                imageMenu.image = UIImage(named: menuItem.getUrlIcon)
                textLabel.text = menuItem.getText
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
        imageMenu.layer.cornerRadius = (imageMenu.frame.size.width)/2
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    @objc  func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        if let cb = onTap{
            cb(menuItem)
        }
    }
    private func commonInit() {
    
        guard let view = UINib(nibName: "MenuCellViewController", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        
        self.backgroundColor = .clear
    }
}

