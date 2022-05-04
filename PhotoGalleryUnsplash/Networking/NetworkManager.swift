//
//  NetworkManager.swift
//  PhotoGalleryUnsplash
//
//  Created by Alex Ch. on 04.05.2022.
//

import Foundation

class NetworkManager {
    
    private let api = Api()
    
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void){
        let parameters = api.prepareParameters(searchTerm: searchTerm)
        let url = api.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = api.prepareHeader()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data? , Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
