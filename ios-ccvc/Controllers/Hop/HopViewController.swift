//
//  HopViewController.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 26/03/2022.
//

import UIKit

class HopViewController: UIViewController {
 
    @IBOutlet var buttom:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttom.addTarget(self, action: #selector(infoButtonPressed(_:)), for: .touchUpInside)

    }
    @objc private func infoButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
