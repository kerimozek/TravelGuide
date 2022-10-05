//
//  HotelsViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit
import Kingfisher

class HotelsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var model = HotelsModel()
    var viewModel = HotelsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "HotelsTableViewCell", bundle: nil), forCellReuseIdentifier: "HotelsTableViewCell")
        viewModel.getMainData()
        tableView.reloadData()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
     
     
        navigationController?.popViewController(animated: true)
    }
    
   

}


// MARK: - EXTENSIONS -

extension HotelsViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
//        detailsVC.model.topPickData = viewModel.hotelsItem(at: indexPath.row)
//        navigationController?.pushViewController(detailsVC, animated: true)
//    }
    
}

extension HotelsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.modelResponse.count
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelsTableViewCell", for: indexPath) as! HotelsTableViewCell
        
        cell.titleLabel.text = viewModel.hotelsItem(at: indexPath.row).name
        cell.detailLabel.text = viewModel.hotelsItem(at: indexPath.row).description
        cell.hotelsImage.kf.setImage(with: URL(string: viewModel.hotelsItem(at: indexPath.row).image))
        return cell
    }
    
    
}
