//
//  BookmarksViewController.swift
//  TravelGuide
//
//  Created by Mehmet Kerim ÖZEK on 2.10.2022.
//

import UIKit
import Kingfisher


class BookmarksViewController: UIViewController {

    // OUTLETS and VARIABLES
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
    
    // SETUP UI FUNCTION
    private func setupUI() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "BookmarksTableViewCell", bundle: nil), forCellReuseIdentifier: "BookmarksTableViewCell")
        viewModel.viewDelegate = self
    }
}


// MARK: - EXTENSIONS -

// EXTENSION FOR UITableViewDelegate
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

// EXTENSION FOR UITableViewDataSource
extension BookmarksViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.model.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarksTableViewCell", for: indexPath) as! BookmarksTableViewCell
        let newItems = viewModel.model.posts[indexPath.row]
        cell.titleLabel.text = newItems.title
        cell.detailLabel.text = newItems.detail
        cell.searchImage.kf.setImage(with: URL(string: newItems.image!))
        return cell
        
    }
    
}

// DELEGATE PROTOCOL
extension BookmarksViewController: BookmarksViewModelViewProtocol {
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
