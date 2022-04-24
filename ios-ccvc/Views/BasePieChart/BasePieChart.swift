

import UIKit
import LoadableViews
import Charts
class BasePieChart: LoadableView {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var titleLable : UILabel!
    @IBInspectable var title : String?{
        didSet{
            if let title = title {
                titleLable.text = title;
            }
        }
    }
//    @IBOutlet weak var myCollectionViewHeight: NSLayoutConstraint!
    override var nibName : String {
        return "BasePieChart"
      }
    
    var dataChart:[ChartData]?{
        didSet{
            addChart()
        }
    }
    @IBOutlet private var chartView : PieChartView!
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        
    }
    func setUpView(){
        setUpCollectionView()
        chartView.entryLabelColor = NSUIColor.red
        chartView.isUserInteractionEnabled = false
        chartView.legend.enabled = false
        chartView.holeColor = .clear
        chartView.holeRadiusPercent = CGFloat(0.4)
        chartView.transparentCircleColor = .clear
        
//        chartView.entryLabelFont = Constants.font.roboto(type: .medium, size: 16)
    }
}
extension BasePieChart {
    
    func addChart(){
                var entri = [ChartDataEntry]()
        var colors = [UIColor]()
        if let list = dataChart {
            var sum : Double = 0;
            list.forEach({result in
                sum = sum + result.value
            })
            list.forEach({value in
                if value.value != 0{
                entri.append(ChartDataEntry(x: percent(value: value.value, sum: sum), y: percent(value: value.value, sum: sum)))
                colors.append(value.color)
                }
            })
                    let set = PieChartDataSet(entries: entri)
            set.colors = colors
                    let data = PieChartData(dataSet: set)
        
                let formatter = NumberFormatter()
                  formatter.numberStyle = .percent
                  formatter.maximumFractionDigits = 2
                  formatter.multiplier = 1.0
            chartView.data = data
            chartView.noDataText = "Không có dữ liệu"
            chartView.noDataFont = Constants.font.roboto(type: .regular, size: 16)
            chartView.data?.setValueFormatter(DefaultValueFormatter(formatter:formatter))
            chartView.data?.setValueFont(Constants.font.roboto(type: .medium, size: 16))
        
            
        }
        
    }
    func percent(value:Double,sum:Double) -> Double {
        let per = ((value / sum) * 100).roundToDecimal(2)
        
        return per
    }
}
extension BasePieChart : UICollectionViewDelegate, UICollectionViewDataSource {
    func setUpCollectionView(){
        collectionView.layoutIfNeeded()
        collectionView.setNeedsLayout()
        let sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let crossPadding = 10.0;
        let mainPadding = 10.0;
        let customFlowLayout = UICollectionViewFlowLayout()
        customFlowLayout.minimumInteritemSpacing = crossPadding
        customFlowLayout.minimumLineSpacing = mainPadding
        customFlowLayout.sectionInset = sectionInset
        customFlowLayout.itemSize = sizeItem
        collectionView.collectionViewLayout = customFlowLayout
        collectionView.dataSource = self
        collectionView.delegate = self
    
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.indentifier)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataChart?.count ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.indentifier, for: indexPath) as! MyCollectionViewCell
        cell.charData = dataChart?[indexPath.row]
        return cell
    
    }

  
    
}
extension BasePieChart{
    var sizeItem : CGSize{
        let sizeWitdh = (SceneDelegate.window?.frame.size.width ?? 0) - (16*2)
        let witdh = ( sizeWitdh - 10) / 2
        return CGSize(width: witdh, height: 20)
    }
}
class ChartData {
    init(title:String,value:Double,color:UIColor){
        self.title = title
        self.value = value
        self.color = color
    }
 

    var title : String;
    var value : Double;
    var color : UIColor;
}
