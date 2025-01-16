//
//  Badge.swift
//  Landmarks
//
//  Created by 황준성 on 1/16/25.
//

import SwiftUI

struct Badge: View {
    
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image("profile")
                .resizable()
                .frame(width: 50, height: 50)
            Text(name)
                .font(.caption)
        }
    }
}

#Preview {
    Badge(name: "siuuuuu")
}
