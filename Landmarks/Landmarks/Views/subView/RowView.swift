//
//  RowView.swift
//  Landmarks
//
//  Created by 황준성 on 1/14/25.
//

import SwiftUI

struct RowView: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .frame(height: 50)
        .padding()
    }
}

#Preview {
    RowView(landmark: ModelData().landmarks[1])
    RowView(landmark: ModelData().landmarks[2])
    RowView(landmark: ModelData().landmarks[3])
}
