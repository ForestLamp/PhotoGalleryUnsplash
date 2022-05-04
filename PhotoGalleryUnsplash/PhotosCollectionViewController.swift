//
//  PhotosCollectionViewController.swift
//  PhotoGalleryUnsplash
//
//  Created by Alex Ch. on 01.05.2022.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
//MARK: - Private properties
    
    private let reuseIdentifier = "Cell"
    private let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        addElementsOnScreen()
    }

// MARK: - Private methods
    
//MARK: Setup UI
    
    private func addElementsOnScreen(){
        setupCollectionView()
        setupSearchBar()
    }
    
    private func setupCollectionView(){
        collectionView.backgroundColor = .orange
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    private func setupSearchBar(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "Search picture"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        searchController.searchBar.delegate = self
    }


// MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        cell.backgroundColor = .green
    
        return cell
    }

}

// MARK: - Extensions

extension PhotosCollectionViewController: UISearchBarDelegate {
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        networkManager.request(searchTerm: searchText) { (_, _) in
            print("123")
        }
    }
}
