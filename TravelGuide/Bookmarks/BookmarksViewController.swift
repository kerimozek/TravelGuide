//
//  BookmarksViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit
import Kingfisher


class BookmarksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = BookmarksViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.didViewLoad()
        tableView.reloadData()
    }

    private func setupUI() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "BookmarksTableViewCell", bundle: nil), forCellReuseIdentifier: "BookmarksTableViewCell")   
    }
}


// MARK: - EXTENSIONS -


extension BookmarksViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        
        let searchItem = viewModel.model.posts[indexPath.row]
        
        detailsVC.model.topPickData = .init(id: "\(searchItem.uuid!)",
                                            category: searchItem.category!,
                                            images: searchItem.image!,
                                            detail: searchItem.detail!,
                                            title: searchItem.title!)
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}

extension BookmarksViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.model.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarksTableViewCell", for: indexPath) as! BookmarksTableViewCell
        cell.titleLabel.text = viewModel.model.posts[indexPath.row].title
        cell.detailLabel.text = viewModel.model.posts[indexPath.row].detail
        cell.searchImage.kf.setImage(with: URL(string: viewModel.model.posts[indexPath.row].image!))
        return cell
        
    }



}

