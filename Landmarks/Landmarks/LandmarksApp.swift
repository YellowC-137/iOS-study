//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 황준성 on 1/13/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    //CoreData 초기화
    let persistenceController = PersistenceController.shared
    
    //뷰의 로컬 상태
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            SwiftUIView()
                .environment(modelData) //하위뷰로 modelData 주입 ,상태 변화시 이 데이터를 참조하는 모든 뷰가 자동으로 업데이트 됨.
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //환경변수 전달
        }
    }
}
