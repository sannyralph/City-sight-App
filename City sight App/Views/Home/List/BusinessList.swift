//
//  BusinessList.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 21/07/2023.
//

import SwiftUI



struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]){
                
                BusinessSection(title: "Restaurants", businesses: model.resturants)
              
                BusinessSection(title: "Arts", businesses: model.sights)
            }
        }
    }
    
    struct BusinessList_Previews: PreviewProvider {
        static var previews: some View {
            BusinessList()
        }
    }
}
