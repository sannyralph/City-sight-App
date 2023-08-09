//
//  BusinessDetails.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 31/07/2023.
//

import SwiftUI

struct BusinessDetails: View {
    var business: Business
    @State private var showDirections = false
    
    var body: some View {
      
        VStack (alignment: .leading){
        
            VStack(alignment: .leading, spacing: 0) {
                
                GeometryReader() {geometry in
                    
                    let uiImage = UIImage(data: business.ImageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                       
                }
                .ignoresSafeArea(.all, edges: .top)
                
                ZStack (alignment: .leading){
                    
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ?  .gray : .blue)
                    
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
            }
            
           
      
            Group {
                HStack{
                    BusinessTitle(business: business)
                        .padding()
                    Spacer()
                    SportonLogo(link: business.url!)
                }
               
                
                LineDivider()
                    .padding(.horizontal )
                
                HStack() {
                    Text("Phone:")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                        .padding()
                }
                
                LineDivider()
                    .padding(.horizontal )
                HStack() {
                    Text("Review:")
                        .bold()
                    Text(String( business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.reviewCount ?? 0)")!)
                        .padding()
                }
                
                LineDivider()
                    .padding(.horizontal )
                
                HStack() {
                    Text("Website:")
                        .bold()
                    Text( business.url ?? "")
                        .lineLimit(1)
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                        .padding()
                }
                
                LineDivider()
                    .padding(.horizontal )
    
            }
            Button {
                showDirections  = true
            } label: {
                ZStack{
                    Rectangle()
                        .frame(height: 48)
                        .background(Color("Background"))
                        .cornerRadius(10)
                    
                    Text("Get Directtions")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()
            .sheet(isPresented: $showDirections) {
                DirectionsView(business: business)
            }
            
        }
        .frame(maxHeight: .infinity)
    }
        
}

