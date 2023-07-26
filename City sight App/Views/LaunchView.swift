//
//  LaunchView.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 22/06/2023.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        VStack {
                
            if model.authorizationState == .notDetermined {
                
            }
            else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
                HomeView()
            }
            else {
                
            }
                
        }
        .padding()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
