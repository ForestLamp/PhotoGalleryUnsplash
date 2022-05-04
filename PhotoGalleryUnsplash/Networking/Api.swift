//
//  Api.swift
//  PhotoGalleryUnsplash
//
//  Created by Alex Ch. on 04.05.2022.
//

import Foundation


class Api {
    
    private let accessKey = "RRSJHKwK0LJ1qXK2IDPdaza2Y8ZtTnXzsHRUcv1BUPU"
    private let numberOfPage = 1
    private let photoPerPage = 90
    
    func prepareParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(numberOfPage)
        parameters["per_page"] = String(photoPerPage)
        return parameters
    }
    
    func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
}
