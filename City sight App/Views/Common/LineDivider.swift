//
//  LineDivider.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 08/08/2023.
//

import SwiftUI

struct LineDivider: View {
    var body: some View {
        
        GeometryReader { geometry  in
            
            Path {path in
                path.move(to: CGPoint.zero)
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundColor(.gray)
        }
        .frame(height: 1)
       
    }
}

struct LineDivider_Previews: PreviewProvider {
    static var previews: some View {
        LineDivider()
    }
}
