//
//  TextFieldCustom.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 13/03/2022.
//

import UIKit

 class TextFieldCustom : UITextField,UITextViewDelegate{
    
    override   init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
      
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }

     func setUpView(){
         self.addTarget(self, action: #selector(TextFieldCustom.textFieldDidChange(_:)), for: .editingChanged)
         self.font = Constants.font.roboto(type: .regular, size: 14)
         self.textColor = UIColor.textFieldDefault
        self.frame.size.height = CGFloat(40)
        self.layer.borderColor = UIColor(hexString:"#E2E8F0").cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = CGFloat(4)
        leftView = UIView(frame: CGRect(x: 16, y: 0, width:16,  height: leftIcon?.size.height ?? 0))
        leftViewMode = .always
        
    }
    @IBInspectable var leftIcon : UIImage? {
        didSet{
            let iconView = UIImageView(frame: CGRect(x: 19, y: 0, width: (leftIcon?.size.width ?? 0), height: leftIcon?.size.height ?? 0)) // set your Own size
               iconView.image = leftIcon
               let iconContainerView: UIView = UIView(frame: CGRect(x: 16, y: 0, width:40,  height: leftIcon?.size.height ?? 0))
               iconContainerView.addSubview(iconView)
               leftView = iconContainerView
               leftViewMode = .always

        }
    }
    @IBInspectable var rightIcon : UIImage? {
        didSet{
            let iconView = UIImageView(frame: CGRect(x: 5, y: 0, width: (leftIcon?.size.width ?? 0), height: leftIcon?.size.height ?? 0)) // set your Own size
               iconView.image = rightIcon
               let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width:(leftIcon?.size.width ?? 0) + 22,  height: leftIcon?.size.height ?? 0))
               iconContainerView.addSubview(iconView)
               rightView = iconContainerView
        }
    }
    
    @IBInspectable var showIconHasText : Bool = false
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if !(textField.text?.isEmpty ?? true){
            if showIconHasText{
                rightViewMode = .always
            }
        }else{
            rightViewMode = .never
        }

    }
    override var placeholder: String?{
        didSet{
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "",attributes: [
               
                NSAttributedString.Key.foregroundColor: UIColor.placeHodlerColor.withAlphaComponent(0.5),
                NSAttributedString.Key.font: Constants.font.roboto(type: .regular, size: 14)
            
            ])
        }
    }
    func cleanText(){
        self.text = ""
        if !(text?.isEmpty ?? true){
            if showIconHasText{
                rightViewMode = .always
            }
        }else{
            rightViewMode = .never
        }

    }
}

