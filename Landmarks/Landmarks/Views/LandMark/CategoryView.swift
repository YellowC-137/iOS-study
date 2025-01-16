//
//  CategoryView.swift
//  Landmarks
//
//  Created by 황준성 on 1/15/25.
//

import SwiftUI

struct CategoryView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[1].image.resizable().scaledToFill().frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.modelData.categories[key] ?? [])
                }
                .listRowInsets(EdgeInsets())
                
            }.navigationTitle("Feature")
        } detail: {
            Text("Detail")
        }
    }
}

#Preview {
    CategoryView()
        .environment(ModelData())
}
