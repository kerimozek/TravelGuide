//
//  TopPickCollectionViewCell.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 3.10.2022.
//

import UIKit

class TopPickCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var topPickView: UIView!
    @IBOutlet weak var titleLabelCell: UILabel!
    @IBOutlet weak var categoryLabelCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    var row: Int!
    var saveButtonPress: ((Int) -> ())?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topPickView.layer.cornerRadius = 10
        imageViewCell.layer.cornerRadius = 10
        shadowView.layer.cornerRadius = 10
    }

    @IBAction func saveButtonClicked(_ sender: Any) {

        saveButtonPress?(row)
        
    }
}




