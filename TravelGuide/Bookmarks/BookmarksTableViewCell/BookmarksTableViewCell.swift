//
//  BookmarksTableViewCell.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 6.10.2022.
//

import UIKit

class BookmarksTableViewCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        searchView.layer.cornerRadius = 10
        searchImage.layer.cornerRadius = 10
        
    }

    
}
