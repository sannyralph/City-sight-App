//
//  OnbordingView.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 08/08/2023.
//

import SwiftUI

struct OnbordingView: View {

    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)

    
    var body: some View {
        VStack {
            
            TabView(selection: $tabSelection) {
                VStack (spacing: 20){
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to my City")
                        .multilineTextAlignment(.center)
                        .bold()
                        .font(.title)
                    Text("We help you locate the best places in Town!!")
                        .multilineTextAlignment(.center)
                }
                .padding()
                .foregroundColor(.white)
                .tag(0)
                VStack (spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Let's show you around")
                        .multilineTextAlignment(.center)
                        .bold()
                        .font(.title)
                    Text("We'll show you the best resturants, vanue and more, base on you current  location!!")
                        .multilineTextAlignment(.center)
                }
                .padding()
                .foregroundColor(.white)
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            Button {
                if tabSelection == 0 {
                    tabSelection = 1
                }
                else {
                    model.requestGeolocationPermission()
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text(tabSelection == 0 ? "Next" : "Get My location")
                        .bold()
                        .padding()
                }
            }
            .accentColor(tabSelection == 0 ? blue : turquoise)
            .padding()
            Spacer()
        }
        .background(tabSelection == 0 ? blue : turquoise)
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
    }
}
