//
//  Daily.swift
//  scrumding
//
//  Created by 황준성 on 2023/07/11.
//

import Foundation

struct Daily : Identifiable {
    let id : UUID
    var title:String
    var attendees : [String]
    var lengthInMinutes: Int
    var theme : Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}



extension Daily {
    static let sampleData : [Daily] =
    [
        Daily(title: "Design", attendees: ["A","B","C"], lengthInMinutes: 5, theme: .bubblegum),
        Daily(title: "App Dev", attendees: ["Z","W","V","Q","L"], lengthInMinutes: 30, theme: .buttercup),
        Daily(title: "Web Dev", attendees: ["D","S","Y","V"], lengthInMinutes: 16, theme: .periwinkle),
    ]
}

