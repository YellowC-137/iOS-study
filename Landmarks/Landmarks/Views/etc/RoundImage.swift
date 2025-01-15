//
//  RoundImage.swift
//  Landmarks
//
//  Created by 황준성 on 1/14/25.
//

import SwiftUI

struct RoundImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(.blue, lineWidth: 5))
    }
}

#Preview {
    RoundImage(image: Image("football"))
}
