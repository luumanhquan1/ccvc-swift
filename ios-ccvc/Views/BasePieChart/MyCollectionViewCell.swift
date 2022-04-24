//
//  MyCollectionViewCell.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 09/04/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var dotView : UIView!
    @IBOutlet var label : UILabel!
    var charData : ChartData?{
        didSet{
            if let charData = charData {
                dotView.layer.backgroundColor = charData.color.cgColor
                label.text = "\(charData.title) (\(Int(charData.value)))"
                
            }
        }
    }
    static let indentifier = "MyCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    override  func awakeFromNib() {
        super.awakeFromNib();
//        self.contentView.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight]
        setUpView()
        
    }
    func setUpView(){
        dotView.layer.cornerRadius = dotView.frame.size.width/2
    }
}
