//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 황준성 on 1/15/25.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Landmark]
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 8)
                .padding(.top, 16)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(alignment: .center, spacing: 16) {
                    ForEach(items) { item in
                        NavigationLink {
                            DetailView(landmark: item)
                        }
                        label : {
                            CategoryItem(landmark: item)
                        }
                    }
                }
            }
        }
        .frame(height: 200)

    }
}

#Preview {
    CategoryRow(categoryName: ModelData().landmarks[1].category.rawValue, items: Array(ModelData().landmarks.prefix(6)))
    //[] 대신에 Array()로 명시적으로 타입 지정 필요
}
