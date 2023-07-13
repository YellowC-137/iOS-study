//
//  scrumdingApp.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/07.
//

import SwiftUI

@main
struct scrumdingApp: App {
    @State private var scrums = Daily.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
