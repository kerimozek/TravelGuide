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
    @IBOutlet weak var addButton: UIButton!
    
    var model = DetailsModel()
    var viewModel = DetailsViewModel()
    var bookmarksViewModel = BookmarksViewModel()
    var buttonChange: ButtonChange = .add
    enum ButtonChange {
        case add
        case delete
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        for i in bookmarksViewModel.model.posts {
            if i.title == titleLabel.text {
                print(i.title!)
                addButton.setImage(UIImage.init(named: "remove-bookmark"), for: .normal)
                buttonChange = .delete
                break
            }
        }
    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addBookmarksClicked(_ sender: Any) {
        
        if buttonChange == .add {
            viewModel.didSaveClicked(topPickData: .init(id: model.topPickData!.id,
                                                        category: model.topPickData!.category,
                                                        images: model.topPickData!.images,
                                                        detail: model.topPickData!.detail,
                                                        title: model.topPickData!.title))
            addButton.setImage(UIImage.init(named: "remove-bookmark"), for: .normal)
            buttonChange = .delete
        } else {
            
            viewModel.didDeleteClicked(titleLabel.text!)
            addButton.setImage(UIImage.init(named: "add-bookmark"), for: .normal)
            buttonChange = .add
        }
    }
    
    func setupUI() {
        detailLabel.isEditable = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        titleLabel.text = model.topPickData?.title
        detailLabel.text = model.topPickData?.detail
        categoryLabel.text = model.topPickData?.category
        if let url = model.topPickData?.images {
            imageView.kf.setImage(with: URL(string: url))
            bookmarksViewModel.didViewLoad()
        }
    }
}
