

import UIKit
import LoadableViews

class InfoItemCell: LoadableView {
    var data : [DataInfo]?{
        didSet{
            if let data = data {
                data.forEach( { value in
                    cellInfo.addArrangedSubview(cell(iconUrl: value.urlIcon, text: "\(value.key): \(value.value)"))
                }
                    
                )
            }
        }
    }
    var tieuDe : String = ""{
        didSet{
            tieuDeUI.text = tieuDe
        }
    }
    var statusTxt : String = ""{
        didSet{
            statusLabel.text = statusTxt
        }
    }
    var statusColor : UIColor?{
        didSet{
            if let statusColor = statusColor {
                statusLabel.textColor = statusColor
            }
        }
    }
    @IBOutlet var cellInfo : UIStackView!
    @IBOutlet var tieuDeUI : UILabel!
    @IBOutlet var statusLabel : UILabel!
    override var nibName: String{
        return "InfoItemCell"
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
        statusLabel.text = ""
    }
}
extension InfoItemCell{
    func cell(iconUrl:String,text:String)-> UIView{
        let viewCell = UIView()
        let icon = UIImageView()
        icon.image = UIImage(named: iconUrl)
        icon.contentMode = .center
        let lable = UILabel()
        lable.text = text
        lable.font = Constants.font.roboto(type: .regular, size: 14)
        lable.textColor = UIColor(hexString: "#667793")
        icon.translatesAutoresizingMaskIntoConstraints = false
        lable.translatesAutoresizingMaskIntoConstraints = false
        viewCell.addSubview(icon)
        viewCell.addSubview(lable)
    
        icon.widthAnchor.constraint(equalToConstant: 14).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 14).isActive = true
        icon.leftAnchor.constraint(equalTo: viewCell.leftAnchor).isActive = true
        icon.topAnchor.constraint(equalTo: viewCell.topAnchor).isActive = true
        icon.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor).isActive = true
        lable.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 12).isActive = true
        lable.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor).isActive = true
        lable.topAnchor.constraint(equalTo: viewCell.topAnchor).isActive = true
        lable.rightAnchor.constraint(equalTo: viewCell.rightAnchor).isActive = true
        return viewCell
    }
}
class DataInfo{
    var urlIcon: String
    var key:String
    var value:String
    init(icon : String, key:String,value:String){
        self.urlIcon = icon
        self.key = key
        self.value = value
    }
}


