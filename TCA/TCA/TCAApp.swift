//
//  TCAApp.swift
//  TCA
//
//  Created by 황준성 on 1/13/25.
//
import ComposableArchitecture
import SwiftUI

@main
struct TCAApp: App {
    
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
        //모든 상태변화 프린트
    }
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CounterView(store: TCAApp.store).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
