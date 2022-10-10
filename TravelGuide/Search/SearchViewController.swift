//
//  SearchViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var noData: UIImageView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var hotelsButtonClicked: UIButton!
    @IBOutlet weak var flightsButtonClicked: UIButton!
    
    var model = SearchModel()
    var viewModel = SearchViewModel()
    
    var buttonActive = "hotel"
    
    var resultSearchHotel: [Hotels] = []
    var resultSearchFlight: Flights = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        searchView.layer.borderWidth = 1.8
        searchView.layer.borderColor = UIColor.gray.cgColor
        searchView.layer.cornerRadius = 4
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        viewModel.getFlightData()
        viewModel.getHotelData()
        viewModel.viewDelegate = self
        noData.isHidden = true
  //      tableView.reloadData()
        
    }
    
    
    @IBAction func searchField(_ sender: UITextField) {
        
        if buttonActive == "hotel" {
            
            let hotelList = viewModel.modelHotelsResponse
            if let searchText = sender.text {
                self.noData.isHidden = true
                if searchText.count > 2 {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.tableView.isHidden = false
                        self.noData.isHidden = true
                        self.resultSearchHotel = hotelList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
                        if self.resultSearchHotel.count == 0 {
                            self.noData.isHidden = false
                        }
                        self.tableView.reloadData()
                    }
                } else {
                    tableView.isHidden = true
                }
            }
        } else {
            
            let flightList = viewModel.modelFlightsResponse
            print(flightList)
            if let searchText = sender.text {
                self.noData.isHidden = true
            
                if searchText.count > 2 {
  
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.tableView.isHidden = false
                        self.noData.isHidden = true
                        self.resultSearchFlight = flightList.filter { $0.flight.number.contains(searchText) }
                        if self.resultSearchFlight.count == 0 {
                            self.noData.isHidden = false
                        }
                        self.tableView.reloadData()
                    }
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    @IBAction func hotelsButtonClicked(_ sender: Any) {
        setupHotelButton()
        buttonActive = "hotel"
        tableView.reloadData()
    }

    @IBAction func flightsButtonClicked(_ sender: Any) {
        setupFlightButton()
        buttonActive = "flight"
        tableView.reloadData()
    }
  
    private func setupHotelButton() {
        let hotel = UIImage(named: "hotels-selected")! as UIImage
        let flight2 = UIImage(named: "flights-unselected")! as UIImage
        hotelsButtonClicked.setImage(hotel, for: .normal)
        flightsButtonClicked.setImage(flight2, for: .normal)
    }
    
    private func setupFlightButton() {
        let flight = UIImage(named: "flights-selected")! as UIImage
        let hotel2 = UIImage(named: "hotels-unselected")! as UIImage
        flightsButtonClicked.setImage(flight, for: .normal)
        hotelsButtonClicked.setImage(hotel2, for: .normal)
    }
}

// MARK: - EXTENSIONS -

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        if buttonActive == "flight" {
            
            let url = "https://images.unsplash.com/photo-1529074963764-98f45c47344b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2372&q=80"
            let flightNewItems = viewModel.flightsItem(at: indexPath.row)
            
            detailsVC.model.topPickData = .init(id: flightNewItems.flight.number,
                                                category: flightNewItems.arrival.airport.rawValue,
                                                images: url,
                                                detail: flightNewItems.airline.name.rawValue,
                                                title: flightNewItems.flight.number)
        }
        
        else {
            let hotelNewItems = viewModel.hotelsItem(at: indexPath.row)
            
            detailsVC.model.topPickData = .init(id: hotelNewItems.id,
                                                category: hotelNewItems.id,
                                                images: hotelNewItems.image,
                                                detail: hotelNewItems.detail,
                                                title: hotelNewItems.name)
        }
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}


extension SearchViewController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if buttonActive == "flight" {
            return resultSearchFlight.count
        } else {
            return resultSearchHotel.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        if buttonActive == "flight" {
            
            let item = resultSearchFlight[indexPath.row]
            cell.titleLabel.text = item.flight.number
            cell.detailLabel.text = item.arrival.airport.rawValue
            let url = "https://images.unsplash.com/photo-1529074963764-98f45c47344b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2372&q=80"
            cell.searchImage.kf.setImage(with: URL(string: url))
        } else {
            let item = resultSearchHotel[indexPath.row]
            cell.titleLabel.text = item.name
            cell.detailLabel.text = item.detail
            cell.searchImage.kf.setImage(with: URL(string: item.image))
        }
   return cell
    }
  
}

// Delegate Protocol
extension SearchViewController: SearchViewModelViewProtocol {
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

