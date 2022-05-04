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
    private let parser = Parser()
    private var timer: Timer?
    private var photos = [UnsplashPhoto]()
    
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
        
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCell.reuseID, for: indexPath) as! PhotosCell
        let unspashPhoto = photos[indexPath.item]
        cell.unsplashPhoto = unspashPhoto
        return cell
    }
    
}

// MARK: - Extensions

extension PhotosCollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.parser.fetchImages(searchTerm: searchText) { [weak self] (searchResults) in
                guard let fetchedPhotos = searchResults else { return }
 //               self?.spinner.stopAnimating()
                self?.photos = fetchedPhotos.results
                self?.collectionView.reloadData()
//                self?.refresh()
            }
        })
    }
}

