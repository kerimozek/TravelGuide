//
//  FlightsViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit
import Kingfisher

class FlightsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var model = FlightsModel()
    var viewModel = FlightsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "FlightsTableViewCell", bundle: nil), forCellReuseIdentifier: "FlightsTableViewCell")
        viewModel.getMainData()
        tableView.reloadData()
    }
    

    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
//
//
//// MARK: - EXTENSIONS -
//
extension FlightsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
    
}

extension FlightsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.modelResponse.count
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightsTableViewCell", for: indexPath) as! FlightsTableViewCell
        
        cell.titleLabel.text = viewModel.flightsItem(at: indexPath.row).flight.number
        cell.detailLabel.text = viewModel.flightsItem(at: indexPath.row).arrival.airport.rawValue
        cell.flightsImage.kf.setImage(with: URL(string: "https://icdn.ensonhaber.com/resimler/galeri/1_11617.jpg"))
        return cell
    }
    
    
}


