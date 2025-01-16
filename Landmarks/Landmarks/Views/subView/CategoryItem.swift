//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 황준성 on 1/15/25.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 150,height: 150)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.callout)
        }
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[2])
}
