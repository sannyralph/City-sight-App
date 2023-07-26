//
//  BusinessSectionHeader.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 21/07/2023.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    @EnvironmentObject var model: ContentModel
    var title: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
        }
    }
}

struct BusinessSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "Restaurants")
    }
}
