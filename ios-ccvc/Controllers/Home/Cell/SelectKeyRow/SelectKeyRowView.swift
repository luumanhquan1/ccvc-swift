//
//  SelectKeyRowView.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 19/04/2022.
//

import UIKit
import LoadableViews

class SelectKeyRowView: LoadableView {
    var onChange :  ((SelectKey) -> Void)?
    var selectKey : SelectKey?
    var listSelectData : [SelectKey]?{
        didSet{
            if let listSelectData = listSelectData {
                selectKey = listSelectData.first
                listSelectData.forEach({keySelect in
                    let item = selectCell(key: keySelect)
                    listSelect.addArrangedSubview(item)
                })
            }
           
        }
    }
    
    @IBOutlet private var listSelect:UIStackView!
    override var nibName: String{
        return "SelectKeyRowView"
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
    
    }

}
extension SelectKeyRowView{
    func selectCell(key:SelectKey)->UIView{
        let viewCell = UIView()
        let lable = UILabel()
        viewCell.addTapGesture{
            self.selectKey = key
            if let onChange = self.onChange{
                onChange(key)
            }
     
            NotificationCenter.default.post(name: Notification.Name("SELECTKEY"), object: self,userInfo: [key: key])
        
        }
        NotificationCenter.default.addObserver(
                forName:  Notification.Name("SELECTKEY"),
                object: self, queue: nil) { _ in
                    print("23223")
                    if self.selectKey == key  {
                        viewCell.backgroundColor = UIColor(hexString: "#7966FF")
                        lable.textColor = UIColor(hexString: "#FFFFFF")
                    }else{
                        viewCell.backgroundColor = UIColor(hexString: "#F2F0FF")
                        lable.textColor = UIColor(hexString: "#7966FF")
                    }
                }
    
        viewCell.layer.cornerRadius = 8
    
        lable.text = key.rawValue
        lable.font = Constants.font.roboto(type: .medium, size: 14)
        lable.textColor = selectKey == key ? UIColor(hexString: "#FFFFFF") : UIColor(hexString: "#7966FF")
        lable.translatesAutoresizingMaskIntoConstraints = false

        viewCell.backgroundColor = selectKey == key ? UIColor(hexString: "#7966FF") : UIColor(hexString: "#F2F0FF")
        viewCell.addSubview(lable)
    
        lable.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 8).isActive = true
        lable.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -8).isActive = true
        lable.leftAnchor.constraint(equalTo: viewCell.leftAnchor, constant: 12).isActive = true
        lable.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -12).isActive = true
        return viewCell
    }
  
}
