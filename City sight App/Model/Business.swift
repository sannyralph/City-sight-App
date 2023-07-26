//
//  Business.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 18/07/2023.
//

import Foundation

class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var ImageData: Data?
    
    var id: String?
    var alias: String?
    var name: String?
    var imageUrl: String?
    var isClosed: Bool?
    var categories: [Category]?
    var coordinates: Coordinate?
    var rating: Double?
    var transactions: [String]?
    var url: String?
    var price: String?
    var location: Locations?
    var phone: String?
    var displayPhone: String?
    var distance: Double?
    var reviewCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case displayPhone = "display_phone"
        case reviewCount = "review_count"

        case id
        case alias
        case name
        case categories
        case coordinates
        case rating
        case transactions
        case url
        case price
        case location
        case phone
        case distance
    }
    
    func getImageData() {
        guard imageUrl != nil else {
            return
        }
        
        if let url = URL(string: imageUrl!) {
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                
                if error == nil {
                    
                    DispatchQueue.main.async {
                        self.ImageData = data!
                    }
                    
                }
            }
            dataTask.resume()
        }
    }
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
    var zipCode: String?
    var country: String?
    var state: String?
    var displayAddress: [String]?
    
    enum CodingKeys: String, CodingKey {
        case zipCode = "zip_code"
        case displayAddress = "display_address"


        case address1
        case address2
        case address3
        case city
        case country
        case state
    }
}

