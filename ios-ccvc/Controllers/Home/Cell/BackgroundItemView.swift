//
//  BackgroundItemView.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 28/03/2022.
//

import UIKit
import LoadableViews
@IBDesignable class BackgroundItemView: LoadableView {
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var subTitleLabel : UILabel!
    @IBOutlet var buttomDrop : UIImageView!
    
    var diaLogSetting : [SettingData] = []
    @IBInspectable var title : String?{
        didSet{
            if let title = title {
                titleLabel.text = title;
            }
        }
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
        buttomDrop.addTapGesture{
             let possitionX = (self.buttomDrop.globalFrame?.origin.x ?? 0)
            let possitionY = (self.buttomDrop.globalFrame?.origin.y ?? 0) + self.buttomDrop.frame.height + 10
            let paddingRight = SceneDelegate.window!.frame.width - possitionX
            let sizeScreen = SceneDelegate.window!.safeAreaLayoutGuide.layoutFrame.size
            let view  = UIView()
            let dialog = DialogSetting()
            
            dialog.dataSetting = self.diaLogSetting
           
            
            dialog.translatesAutoresizingMaskIntoConstraints = false
         
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .clear
            let screen = SceneDelegate.window!;
            SceneDelegate.window?.addSubview(view)
            view.addSubview(dialog)
        
        
            view.topAnchor.constraint(equalTo: screen.topAnchor, constant: 0).isActive = true
            view.bottomAnchor.constraint(equalTo: screen.bottomAnchor, constant: 0).isActive = true
            view.leftAnchor.constraint(equalTo: screen.leftAnchor, constant: 0).isActive = true
            view.rightAnchor.constraint(equalTo: screen.rightAnchor, constant: 0).isActive = true
           
            if (sizeScreen.height - possitionY) < dialog.sizeLayout.height {
                let paddingBottom = possitionY - dialog.sizeLayout.height - self.buttomDrop.frame.height - 10
                dialog.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -paddingRight).isActive = true
                dialog.topAnchor.constraint(equalTo: view.topAnchor, constant: paddingBottom).isActive = true
            }else{
                dialog.topAnchor.constraint(equalTo: view.topAnchor, constant: possitionY).isActive = true
                dialog.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -paddingRight).isActive = true
            }
          
          
            dialog.addTapGesture{
                
            }
            view.addTapGesture{
                view.removeFromSuperview()
            }
            
//            view.removeFromSuperview()
        }
    }

    override var nibName : String {
        return "BackgroundItemView"
      }
}
