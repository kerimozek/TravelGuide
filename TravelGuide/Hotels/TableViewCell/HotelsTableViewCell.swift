//
//  HotelsTableViewCell.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 5.10.2022.
//

import UIKit

class HotelsTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var hotelView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        selectionStyle = .none
        hotelView.layer.cornerRadius = 10
        hotelsImage.layer.cornerRadius = 10
        
        
    }

   
    
}
