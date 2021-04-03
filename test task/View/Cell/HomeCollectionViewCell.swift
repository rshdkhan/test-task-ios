//
//  HomeCollectionViewCell.swift
//  test task
//
//  Created by Rashid Khan on 4/3/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewBG: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.viewBG.layer.borderWidth = 1
        self.viewBG.layer.cornerRadius = 5
        self.viewBG.layer.borderColor = UIColor.clear.cgColor
        self.viewBG.layer.masksToBounds = true

        self.layer.shadowOpacity = 0.18
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
    }
    
    func setup(item: String) {
        
    }

}
