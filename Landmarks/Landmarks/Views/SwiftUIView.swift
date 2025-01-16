//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by 황준성 on 1/13/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryView()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }

}

#Preview {
    //Model Object 추가, 서브뷰들에 오브젝트 사용가능하게함
    SwiftUIView().environment(ModelData())
}

