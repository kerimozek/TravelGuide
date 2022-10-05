//
//  FlightsTableViewCell.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import UIKit

class FlightsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flightsView: UIView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var flightsImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        flightsImage.layer.cornerRadius = 10
        flightsView.layer.cornerRadius = 10
        
    }
    
    
}


