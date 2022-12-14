//
//  HotelsViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit
import Kingfisher

class HotelsViewController: UIViewController {
    
    // OUTLETS and VARIABLES
    @IBOutlet weak var tableView: UITableView!
    var model = HotelsModel()
    var viewModel = HotelsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       setupUI()
    }
    
    // SETUP UI FUNCTION
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "HotelsTableViewCell", bundle: nil), forCellReuseIdentifier: "HotelsTableViewCell")
        viewModel.getMainData()
        viewModel.viewDelegate = self
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


// MARK: - EXTENSIONS -

// EXTENSION FOR UITableViewDelegate
extension HotelsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let hotelNewItems = viewModel.hotelsItem(at: indexPath.row)
        detailsVC.model.topPickData = .init(id: hotelNewItems.id,
                                            category: hotelNewItems.id,
                                            images: hotelNewItems.image,
                                            detail: hotelNewItems.detail,
                                            title: hotelNewItems.name)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }

}

// EXTENSION FOR UITableViewDataSource
extension HotelsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.modelResponse.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelsTableViewCell", for: indexPath) as! HotelsTableViewCell
        let hotelNewItems = viewModel.hotelsItem(at: indexPath.row)
        cell.titleLabel.text = hotelNewItems.name
        cell.detailLabel.text = hotelNewItems.detail
        cell.hotelsImage.kf.setImage(with: URL(string: hotelNewItems.image))
        return cell
    }
  
}

// DELEGATE PROTOCOL
extension HotelsViewController: HotelsViewModelViewProtocol {
    func didCellItemFetch(isSuccess: Bool) {
        if isSuccess == true {
            DispatchQueue.main.async  { [weak self] in
                guard let self = self else {return}
                self.tableView.reloadData()
            }
        } else {
            print("error")
        }
    }
}
