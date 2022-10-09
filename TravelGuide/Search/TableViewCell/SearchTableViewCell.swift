//
//  SearchTableViewCell.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var searchView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        searchView.layer.cornerRadius = 10
        searchImage.layer.cornerRadius = 10
        
    }

    
    
}
