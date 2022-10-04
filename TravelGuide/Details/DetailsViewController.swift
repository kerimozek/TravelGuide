//
//  DetailsViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailLabel: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var model = DetailsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        titleLabel.text = model.posts?.title
        detailLabel.text = model.posts?.description
        categoryLabel.text = model.posts?.category
        if let url = model.posts?.images {
            imageView.kf.setImage(with: URL(string: url))
        }
       

        
    }
    

    @IBAction func backButtonClicked(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
          
    }
    
    
    @IBAction func addBookmarksClicked(_ sender: Any) {
        
    }
    
   

}
