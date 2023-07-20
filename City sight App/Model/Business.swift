//
//  Business.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 18/07/2023.
//

import Foundation

struct Business: Decodable {
    var id: String?
    var alias: String?
    var name: String?
    var image_url: String?
    var is_closed: Bool?
    var categories: [Category]?
    var coordinates: Coordinate?
    var rating: Double?
    var transactions: [String]?
    var url: String?
    var price: String?
    var location: Locations?
    var phone: String?
    var display_phone: String?
    var distance: String?
    
}

struct Category: Decodable {
    var alias: String?
    var categories: String?
    
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}

struct Locations: Decodable {
    
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zip_code: String?
    var country: String?
    var state: String?
    var display_address: [String]?
}

