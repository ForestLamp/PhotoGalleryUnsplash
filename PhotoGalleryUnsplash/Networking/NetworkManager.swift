//
//  NetworkManager.swift
//  PhotoGalleryUnsplash
//
//  Created by Alex Ch. on 04.05.2022.
//

import Foundation

class NetworkManager {
    
    private let api = Api()
    
    func request(searchTerm: String, completion: (Data?, Error?) -> Void){
        let parameters = api.prepareParameters(searchTerm: searchTerm)
        let url = api.url(params: parameters)
        print(url)
    }
}
