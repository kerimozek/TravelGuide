//
//  MainViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = MainViewModel()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(.init(nibName: "TopPickCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopPickCollectionViewCell")
        viewModel.getMainData()
        collectionView.reloadData()
    }
    

    @IBAction func flightsButtonClicked(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FlightsViewController")
        navigationController?.pushViewController(vc!, animated: true)
       
    }
    
    
    @IBAction func hotelsButtonClicked(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HotelsViewController")
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}


// MARK: - EXTENSIONS -


extension MainViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.modelResponse.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopPickCollectionViewCell", for: indexPath) as! TopPickCollectionViewCell
        
        cell.titleLabelCell.text = viewModel.topPickItem(at: indexPath.row).title
        cell.categoryLabelCell.text = viewModel.topPickItem(at: indexPath.row).category
        cell.imageViewCell.kf.setImage(with: URL(string: viewModel.topPickItem(at: indexPath.row).images))
        return cell
    }

}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsVC.model.topPickData = viewModel.topPickItem(at: indexPath.row)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 1.5 , height: collectionView.frame.height)
    }
}


