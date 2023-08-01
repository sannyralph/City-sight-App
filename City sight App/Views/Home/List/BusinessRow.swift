//
//  BusinessRow.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 23/07/2023.
//

import SwiftUI

struct BusinessRow: View {
    
 @ObservedObject var business: Business
    
    var body: some View {
        VStack (alignment: .leading){
            
            HStack{
                
                let uiImage = UIImage(data: business.ImageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(5)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(business.name ?? "")
                        .bold()
                    Text(String(format: "%.1f km away", (business.distance ?? 0)/1000 ))
                        .font(.caption)
                }
                Spacer()
                VStack(alignment: .leading){
                    Image("regular_\(String(business.rating ?? 0))")
                    Text("\(business.reviewCount ?? 0) Reviews" )
                        .font(.caption)
                }
            }
            .foregroundColor(.black)
            Divider()
        }
    }
}

//struct BusinessRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessRow()
//    }
//}
