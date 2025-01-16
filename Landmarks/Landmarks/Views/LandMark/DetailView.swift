//
//  DetailView.swift
//  Landmarks
//
//  Created by 황준성 on 1/14/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var index:Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    //View 연결
    var body: some View {
        //modelData를 데이터바인딩
        //상위 뷰로부터 전달받은 데이터
        @Bindable var modelData = modelData
        
        ScrollView (showsIndicators: false){
            
            MapView(coordinator: landmark.location)
                .frame(width: 300, height: 300)
            
            RoundImage(image: landmark.image)
                .offset(y: -100)
                .padding(.bottom, -100)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[index].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text(landmark.description)
                    .font(.caption2)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(landmark: ModelData().landmarks[1])
        .environment(ModelData())
}
