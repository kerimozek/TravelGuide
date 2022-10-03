//
//  SearchViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var hotelsButtonClicked: UIButton!
    
    @IBOutlet weak var flightsButtonClicked: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchView.layer.borderWidth = 1.8
        searchView.layer.borderColor = UIColor.gray.cgColor
        searchView.layer.cornerRadius = 4
    }
    

    
    @IBAction func hotelsButtonClicked(_ sender: Any) {
        let hotel = UIImage(named: "hotels-selected")! as UIImage
        let flight2 = UIImage(named: "flights-unselected")! as UIImage
        hotelsButtonClicked.setImage(hotel, for: .normal)
        flightsButtonClicked.setImage(flight2, for: .normal)
        
    }
    
    
    @IBAction func flightsButtonClicked(_ sender: Any) {
        let flight = UIImage(named: "flights-selected")! as UIImage
        let hotel2 = UIImage(named: "hotels-unselected")! as UIImage
        flightsButtonClicked.setImage(flight, for: .normal)
        hotelsButtonClicked.setImage(hotel2, for: .normal)
    }
    

}
