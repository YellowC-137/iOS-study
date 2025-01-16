//
//  ProfileDetailView.swift
//  Landmarks
//
//  Created by 황준성 on 1/16/25.
//

import SwiftUI

struct ProfileDetailView: View {
    
    var profile : Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text(profile.name)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.preferNoti ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Badges")
                        .font(.headline)
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            Badge(name: "siu")
                            Badge(name: "siiiii")
                                .hueRotation(Angle(degrees: 60))
                            Badge(name: "suuuu")
                                .grayscale(0.4)
                                .hueRotation(Angle(degrees: 150))
                        }
                    }
                }
                .padding()
                
            }
        }
        .padding()
    }
}

#Preview {
    ProfileDetailView(profile: Profile.default)
}
