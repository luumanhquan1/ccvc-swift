//
//  DialogSetting.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 24/04/2022.
//

import UIKit
import LoadableViews

class DialogSetting: LoadableView {
    @IBOutlet var statckView : UIStackView!
    override var nibName: String{
        return "DialogSetting"
    }
    var sizeLayout : CGSize = CGSize(width: 0, height: 0)
    var dataSetting : [SettingData] = []{
        didSet{
            dataSetting.forEach({value in
                let data = DialogActionCell()
                data.dataSetting = value
                statckView.addArrangedSubview(data)
            })
            let size = self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            sizeLayout = size
            
        }
       
    }
    
}
class DialogActionCell : UIView{
    var selectKey : DialogSettingKey?
    var dataSetting : SettingData?{
        didSet{
            selectKey = dataSetting?.initData;
            viewSelectDialog()
            
        }
    }
   
    func viewSelectDialog(){

        let actionList = UIStackView()
        let titleLabel = UILabel()
        titleLabel.font = Constants.font.roboto(type: .medium, size: 16)
        titleLabel.textColor = UIColor(hexString: "#3D5586")
        actionList.axis = .vertical
        actionList.alignment = .leading

        actionList.spacing = 8
        if let dataSetting = dataSetting {
            titleLabel.text = dataSetting.title
            dataSetting.listKey.forEach({value in
                actionList.addArrangedSubview(acctionCell(key: value))
            })
        }
        
      
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionList.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        self.addSubview(actionList)
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
        
        actionList.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        actionList.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        actionList.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        actionList.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
//        return view
        
        
    }
    func acctionCell(key : DialogSettingKey)->UIView{
        let contentView = UIView()
        contentView.backgroundColor = .clear
        let button = UIView()
        
        button.backgroundColor = self.selectKey == key ? UIColor(hexString: "#7966FF") : UIColor.clear
        button.layer.cornerRadius = 17
        let label = UILabel()
        label.text = key.rawValue
        label.font = Constants.font.roboto(type: .medium, size: 14)
        label.textColor = self.selectKey == key ? UIColor(hexString: "#FFFFFF") : UIColor(hexString:"#A2AEBD")
        button.addSubview(label)
        contentView.addSubview(button)
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        label.topAnchor.constraint(equalTo: button.topAnchor, constant: 8).isActive = true
        label.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -8).isActive = true
        label.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -16).isActive = true
        label.leftAnchor.constraint(equalTo: button.leftAnchor, constant: 16).isActive = true

        button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        button.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        button.addTapGesture{
            self.selectKey = key
            NotificationCenter.default.post(name: Notification.Name("SELECTKEYDIALOG"), object: self,userInfo: [key: key])
            if let dataSetting = self.dataSetting {
                dataSetting.onChange(key)
            }
            
        }
        NotificationCenter.default.addObserver(
                forName:  Notification.Name("SELECTKEYDIALOG"),
                object: self, queue: nil) { _ in
                    if self.selectKey == key  {
                        button.backgroundColor = UIColor(hexString: "#7966FF")
                        label.textColor = UIColor(hexString: "#FFFFFF")
                    }else{
                        button.backgroundColor = UIColor.clear
                        label.textColor = UIColor(hexString: "#A2AEBD")
                    }
                }
        

      
    
        return contentView
    }
}
class SettingData{
    var title:String
    var listKey : [DialogSettingKey]
    var initData : DialogSettingKey
    var onChange : (DialogSettingKey) -> Void
    init(title:String,keys:[DialogSettingKey],initData:DialogSettingKey = DialogSettingKey.homNay,onChange : @escaping (DialogSettingKey) -> Void){
        self.title = title
        listKey = keys
        self.initData = initData
        self.onChange = onChange
    }
}

