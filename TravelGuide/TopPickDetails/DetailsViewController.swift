//
//  DetailsViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit
import Kingfisher


protocol DetailsViewProtocol {
    func updateUI()
}

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailLabel: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var model = DetailsModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    

    @IBAction func backButtonClicked(_ sender: Any) {
      navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addBookmarksClicked(_ sender: Any) {
        
    }
    
    func setupUI() {
        detailLabel.isEditable = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        titleLabel.text = model.topPickData?.title
        detailLabel.text = model.topPickData?.description
        categoryLabel.text = model.topPickData?.category
        if let url = model.topPickData?.images {
            imageView.kf.setImage(with: URL(string: url))
        }
    }

}
