//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 황준성 on 1/14/25.
//

import SwiftUI

struct LandmarkList: View {
    
    //ModelData의 현재값을 읽어옴
    //상위 뷰로부터 데이터를 받아와서 하위뷰에 연결
    @Environment(ModelData.self) var modelData
    
    //데이터 바인딩을 위한 state 선언
    @State private var showFavorites = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{
            landmark in
            //favorite 리스트만 보여주도록 필터 설정
            (!showFavorites || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationSplitView {
    //  (리스트,id 주입)시에  List(landmarks, id: \.id) {
            
            //landmarks가 Idntifiable 타입이므로 id 주입이 필요없음.
            List {
                
                Toggle(isOn: $showFavorites){
                    Text("Show Favorites")
                }
                
                //동적 리스트 구현을 위한 ForEach
                ForEach(filteredLandmarks) {
                    land in
                    NavigationLink() {
                        DetailView(landmark: land)
                    } label: {
                        RowView(landmark: land)
                    }
                }
            }
            //filteredLandmarks 의 값이 변화할때 애니메이션 시작
            .animation(.default,value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Detail")
        }
        }
        

}

#Preview {
    //데이터 주입 필요
    LandmarkList()
        .environment(ModelData())
}
