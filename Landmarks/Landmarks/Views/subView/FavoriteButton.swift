//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 황준성 on 1/15/25.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
            print(isSet)
        } label: {
            Label("Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
