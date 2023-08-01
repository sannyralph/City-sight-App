//
//  HomeView.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 21/07/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        if model.resturants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                if !isMapShowing {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text("My location")
                            Spacer()
                            Text("Switch to map")
                        }
                        Divider()
                        BusinessList()
                    }
                    .padding([.horizontal, .top] )
                    .navigationBarHidden(true)
                }
                else {
                    
                }
            }
          
                
        }
        else {
            ProgressView()
        }
        
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
