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
    @State var selectedBusiness:Business?
    
    var body: some View {
        if model.resturants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                if !isMapShowing {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text("My location")
                            Spacer()
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        ZStack(alignment: .top){
                            BusinessList()
                            
                            HStack{
                                Spacer()
                                SportonLogo(link: "https://sanniabdulrafiu.netlify.app/")
                            }
                            .padding(.trailing, -20)
                        }
                        
                    }
                    .padding([.horizontal, .top] )
                    .navigationBarHidden(true)
                    
                }
                
                else {
                    
                    ZStack(alignment: .top) {
                        
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea(.all)
                            .sheet(item: $selectedBusiness) { business in
                                BusinessDetails(business: business)
                            }
                        
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            
                            HStack {
                                Image(systemName: "location")
                                Text("My location")
                                Spacer()
                                Button("Switch to list view") {
                                    self.isMapShowing = false
                                }
                            }
                            .padding()
                            
                        }
                        .padding()
                    }
                    .navigationBarHidden(true)
                }
               
                
            }
            
//            else {
//                ProgressView()
//            }
            
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
