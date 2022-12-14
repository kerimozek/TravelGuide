//
//  FlightsViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit
import Kingfisher

class FlightsViewController: UIViewController {

    // OUTLETS and VARIABLES
    @IBOutlet weak var tableView: UITableView!
    var model = FlightsModel()
    var viewModel = FlightsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    // SETUP UI FUNCTION
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "FlightsTableViewCell", bundle: nil), forCellReuseIdentifier: "FlightsTableViewCell")
        viewModel.getMainData()
        viewModel.viewDelegate = self
    }
    
    // BACK BUTTON
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - EXTENSIONS -

// EXTENSION FOR UITableViewDelegate
extension FlightsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let url = "https://images.unsplash.com/photo-1529074963764-98f45c47344b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2372&q=80"
        let flightNewItems = viewModel.flightsItem(at: indexPath.row)
        
        detailsVC.model.topPickData = .init(id: flightNewItems.flight.number,
                                            category: flightNewItems.airline.callsign.rawValue,
                                            images: url,
                                            detail: "\(flightNewItems.airline.name.rawValue) \nDeparture: \(flightNewItems.departure.airport.rawValue) - \(flightNewItems.departure.iata.rawValue) \nArrival: \(flightNewItems.arrival.airport.rawValue) - \(flightNewItems.arrival.iata.rawValue)",
                                            title: "Flight Number: \(flightNewItems.flight.number)")
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
}

// EXTENSION FOR UITableViewDataSource
extension FlightsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.modelResponse!.count
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightsTableViewCell", for: indexPath) as! FlightsTableViewCell
        let newFlightsItem = viewModel.flightsItem(at: indexPath.row)
        cell.titleLabel.text = newFlightsItem.flight.number
        cell.detailLabel.text = newFlightsItem.airline.name.rawValue
        let url = "https://images.unsplash.com/photo-1529074963764-98f45c47344b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2372&q=80"
        cell.flightsImage.kf.setImage(with: URL(string: url))
        return cell
    }
    
    
}

// DELEGATE PROTOCOL
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
