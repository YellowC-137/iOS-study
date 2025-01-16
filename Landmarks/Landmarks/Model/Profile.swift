//
//  ProfileView.swift
//  Landmarks
//
//  Created by 황준성 on 1/16/25.
//

import SwiftUI

struct Profile {
    
    var name: String
    var preferNoti = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(name: "Arteta")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"


        var id: String { rawValue }
    }

}

