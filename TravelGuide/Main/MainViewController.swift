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
    var bookmarksViewModel = BookmarksViewModel()
    var model = DetailsModel()
    var detailsViewModel = DetailsViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bookmarksViewModel.didViewLoad()
        collectionView.reloadData()
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(.init(nibName: "TopPickCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopPickCollectionViewCell")
        viewModel.getMainData()
        //   bookmarksViewModel.didViewLoad()
        
    }
    
    func changeBookmarks(item: topPick) {
        var change = false
        for i in self.bookmarksViewModel.model.posts {
            if i.title == item.title {
                self.detailsViewModel.didDeleteClicked(item.title)
                change = true
            }
        }
        if change == false {
            
            self.detailsViewModel.didSaveClicked(topPickData: .init(id: "\(item.id)",
                                                                    category: item.category,
                                                                    images: item.images,
                                                                    detail: item.detail,
                                                                    title: item.title))
            self.bookmarksViewModel.didViewLoad()
        }
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
        
        
        let item = viewModel.topPickItem(at: indexPath.row)
        cell.titleLabelCell.text = item.title
        cell.categoryLabelCell.text = item.category
        cell.imageViewCell.kf.setImage(with: URL(string: item.images))
        cell.saveButton.setImage(UIImage.init(named: "bookmark-main"), for: .normal)
        
        for i in self.bookmarksViewModel.model.posts {
            if i.title == item.title {
                cell.saveButton.setImage(UIImage.init(named: "bookmark-main-fill"), for: .normal)
            }
        }
        cell.row = indexPath.row
        cell.saveButtonPress = { [self] index in
            
            changeBookmarks(item: item)
            
            self.collectionView.reloadItems(at: [indexPath])
        }
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


