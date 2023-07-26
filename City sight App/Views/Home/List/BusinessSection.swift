//
//  BusinessSection.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 21/07/2023.
//

import SwiftUI



struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        Section (header: BusinessSectionHeader(title: title)){
            ForEach(businesses) { business in
                BusinessRow(business: business)
            }
        }
    }
}

