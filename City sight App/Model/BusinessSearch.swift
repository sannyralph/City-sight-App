//
//  BusinessSearch.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 18/07/2023.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}

struct Region: Decodable {
    var center = Coordinate()
    
}
