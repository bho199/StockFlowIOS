//
//  WalletCollectionViewCell.swift
//  StockflowFinal
//
//  Created by Alessandro Li Greci on 08/05/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import UIKit

class WalletCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var walletCrypto: UILabel!
    @IBOutlet weak var walletBuyTime: UILabel!
    @IBOutlet weak var walletBuyValue: UILabel!
    @IBOutlet weak var walletQuantity: UILabel!
    @IBOutlet weak var walletActualValue: UILabel!
    @IBOutlet weak var walletChange: UILabel!
    @IBOutlet weak var walletView: UIView!
}
