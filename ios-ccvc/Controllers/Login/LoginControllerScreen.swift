//
//  LoginControllerScreen.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 13/03/2022.
//

import UIKit

class LoginControllerScreen: UIViewController {
  
  
    @IBOutlet weak var dangNhapBtn : UIButton!
    @IBOutlet weak var taiKhoanTextField : TextFieldCustom!
    @IBOutlet weak var matKhauTextField : TextFieldCustom!
    
    var isHidePass : Bool = true{
        didSet{
            matKhauTextField.isSecureTextEntry = isHidePass
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @objc  func onClean(){
        taiKhoanTextField.cleanText()
    }
    @IBAction func buttonPressed(sender: UIButton) {
     SceneDelegate.window?.makeKeyAndVisible()
        SceneDelegate.window?.rootViewController = MainTabbarController()
//        VCService.push(controller: MainTabbarController())
//        let navController =  UINavigationController(rootViewController: MainTabbarController())
     
        
     
    }

}
extension LoginControllerScreen {
    func setUpUI(){
        
        matKhauTextField.rightIcon = UIImage(named: "ic_mat_khoa")
        setUpMatKhau()
        matKhauTextField.isSecureTextEntry = isHidePass
          dangNhapBtn.layer.cornerRadius = 4
           let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onClean))
        taiKhoanTextField.rightView?.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func onHidePass(){
        isHidePass = !isHidePass
        if isHidePass {
            matKhauTextField.rightIcon = UIImage(named: "ic_mat_khoa")
        }else{
            matKhauTextField.rightIcon = UIImage(named: "ic_mat_mo")
        }
        
     setUpMatKhau()
    }
    func setUpMatKhau(){
        let tapHidePassGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onHidePass))
        matKhauTextField.rightView?.addGestureRecognizer(tapHidePassGestureRecognizer)
    }

}
