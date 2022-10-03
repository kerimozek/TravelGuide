//
//  MainViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    // MARK: - MAIN


    @IBAction func flightsButtonClicked(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FlightsViewController")
        navigationController?.pushViewController(vc!, animated: true)
       
    }
    
    
    @IBAction func hotelsButtonClicked(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HotelsViewController")
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}




//extension MainViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//}
//
//extension MainViewController: UICollectionViewDelegate {
//
//}
//
//extension MainViewController: UICollectionViewDelegateFlowLayout {
//
//}
