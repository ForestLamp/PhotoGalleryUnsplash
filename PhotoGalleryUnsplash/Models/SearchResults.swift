//
//  SearchResults.swift
//  PhotoGalleryUnsplash
//
//  Created by Alex Ch. on 04.05.2022.
//

import Foundation

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKind.RawValue: String]
    let user: [User.RawValue: String]
    
    
    enum URLKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
    
    enum User: String{
        case username
        case name
    }
}
