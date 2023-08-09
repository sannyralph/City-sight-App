//
//  LocationDeniedView.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 08/08/2023.
//

import SwiftUI

struct LocationDeniedView: View {
    @EnvironmentObject var model: ContentModel
    
    private let backgroundColor = Color(red: 136/255, green: 8/255, blue: 8/255)
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Whoops!")
                .bold()
                .font(.title)
            Text("We need to access you location to provide you with the best sight of the City. You can change this decision anytime in the setting ")
            Spacer()
            Button {
                // go to settings
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(height: 48)
                    
                    Text("Go to settings")
                        .bold()
                        .padding()
                        .foregroundColor(backgroundColor)
                }
              
            }
            .padding()
            Spacer()
            
        }
        .foregroundColor(.white)
        .background(backgroundColor)
        .multilineTextAlignment(.center)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
