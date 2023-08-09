//
//  SportonLogo.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 08/08/2023.
//

import SwiftUI

struct SportonLogo: View {
    var link: String
    
    var body: some View {
        Link(destination: URL(string: link)!) {
            Image("sporton")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
                
        }
        .background(.yellow)
    }
}

struct SportonLogo_Previews: PreviewProvider {
    static var previews: some View {
        SportonLogo(link: "https://sanniabdulrafiu.netlify.app/")
    }
}
