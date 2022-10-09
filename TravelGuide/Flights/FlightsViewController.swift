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

    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "FlightsTableViewCell", bundle: nil), forCellReuseIdentifier: "FlightsTableViewCell")
        viewModel.getMainData()
        viewModel.viewDelegate = self
    }
    

    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - EXTENSIONS -

extension FlightsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let url = "https://icdn.ensonhaber.com/resimler/galeri/1_11617.jpg"
        let flightNewItems = viewModel.flightsItem(at: indexPath.row)
        
        detailsVC.model.topPickData = .init(id: flightNewItems.flight.number,
                                            category: flightNewItems.arrival.airport.rawValue,
                                            images: url,
                                            detail: flightNewItems.airline.name.rawValue,
                                            title: flightNewItems.flight.number)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
}

extension FlightsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.modelResponse!.count
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightsTableViewCell", for: indexPath) as! FlightsTableViewCell
        
        cell.titleLabel.text = viewModel.flightsItem(at: indexPath.row).flight.number
        print(viewModel.flightsItem(at: indexPath.row))
        cell.detailLabel.text = viewModel.flightsItem(at: indexPath.row).arrival.airport.rawValue
        cell.flightsImage.kf.setImage(with: URL(string: "https://icdn.ensonhaber.com/resimler/galeri/1_11617.jpg"))
        return cell
    }
    
    
}

// Delegate Protocol
extension FlightsViewController: FlightsViewModelViewProtocol {
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
