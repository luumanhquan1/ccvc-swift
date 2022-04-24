//
//  TongHopNhiemVuView.swift
//  ios-ccvc
//
//  Created by Lưu Mạnh Quân on 24/04/2022.
//

import UIKit
import LoadableViews

class TongHopNhiemVuView: LoadableView {
    @IBOutlet var collectionView : UICollectionView!
    override var nibName: String{
        return "TongHopNhiemVuView"
    }


    
}
